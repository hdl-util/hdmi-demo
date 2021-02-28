action = "synthesis"
syn_device = "xc7s15"
syn_grade = "-1"
syn_package = "ftgb196"
syn_top = "sea_top"
syn_project = "sea_top"
syn_tool = "vivado"
syn_properties = [
  ["steps.synth_design.args.more options", "-effort_level quick"],
  ["steps.synth_design.args.directive", "RunTimeOptimized"],
  ["steps.opt_design.args.directive", "RuntimeOptimized"],
  ["steps.place_design.args.directive", "RuntimeOptimized"],
  ["steps.route_design.args.directive", "RuntimeOptimized"],
]

modules = {
  "local" : [
    "../../top/sea",
    "../../pll"
  ],
}
