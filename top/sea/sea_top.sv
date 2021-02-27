module sea_top
(
  input CLK_100MHZ,

  output [1:0] LED,

  // HDMI output
  output [2:0] HDMI_TX,
  output [2:0] HDMI_TX_N,
  output HDMI_CLK,
  output HDMI_CLK_N,
  input HDMI_CEC,
  inout HDMI_SDA,
  inout HDMI_SCL,
  input HDMI_HPD
);

wire clk_pixel_x5;
wire clk_pixel;
wire clk_audio;
hdmi_pll_xilinx hdmi_pll(.in_clk(CLK_100MHZ), .c0(clk_pixel), .c1(clk_pixel_x5));

logic [9:0] counter = 1'd0;
always_ff @(posedge clk_pixel)
begin
    counter <= counter == 10'd524 ? 1'd0 : counter + 1'd1;
end
assign clk_audio = clk_pixel && counter == 10'd524;

localparam AUDIO_BIT_WIDTH = 16;
localparam AUDIO_RATE = 48000;
localparam WAVE_RATE = 480;

logic [AUDIO_BIT_WIDTH-1:0] audio_sample_word;
logic [AUDIO_BIT_WIDTH-1:0] audio_sample_word_dampened; // This is to avoid giving you a heart attack -- it'll be really loud if it uses the full dynamic range.
assign audio_sample_word_dampened = audio_sample_word >> 9;

sawtooth #(.BIT_WIDTH(AUDIO_BIT_WIDTH), .SAMPLE_RATE(AUDIO_RATE), .WAVE_RATE(WAVE_RATE)) sawtooth (.clk_audio(clk_audio), .level(audio_sample_word));

logic [23:0] rgb;
logic [9:0] cx, cy;
// logic [2:0] tmds;
// logic tmds_clock;
hdmi #(.VIDEO_ID_CODE(1), .DDRIO(0), .VIDEO_REFRESH_RATE(60.0), .AUDIO_RATE(AUDIO_RATE), .AUDIO_BIT_WIDTH(AUDIO_BIT_WIDTH)) hdmi(.clk_pixel_x10(clk_pixel_x5), .clk_pixel(clk_pixel), .clk_audio(clk_audio), .rgb(rgb), .audio_sample_word('{audio_sample_word_dampened, audio_sample_word_dampened}), .tmds_p(HDMI_TX), .tmds_n(HDMI_TX_N), .tmds_clock_p(HDMI_CLK), .tmds_clock_n(HDMI_CLK_N), .cx(cx), .cy(cy));

// genvar i;
// generate
//     for (i = 0; i < 3; i++)
//     begin: obufds_gen
//         OBUFDS #(.IOSTANDARD("TMDS_33")) obufds (.I(tmds[i]), .O(HDMI_TX[i]), .OB(HDMI_TX_N[i]));
//     end
//     OBUFDS #(.IOSTANDARD("TMDS_33")) obufds_clock(.I(tmds_clock), .O(HDMI_CLK), .OB(HDMI_CLK_N));
// endgenerate

logic [7:0] character = 8'h30;
logic [5:0] prevcy = 6'd0;
always @(posedge clk_pixel)
begin
    if (cy == 10'd0)
    begin
        character <= 8'h30;
        prevcy <= 6'd0;
    end
    else if (prevcy != cy[9:4])
    begin
        character <= character + 8'h01;
        prevcy <= cy[9:4];
    end
end

console console(.clk_pixel(clk_pixel), .codepoint(character), .attribute({cx[9], cy[8:6], cx[8:5]}), .cx(cx), .cy(cy), .rgb(rgb));
endmodule
