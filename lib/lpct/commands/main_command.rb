require "clamp"

class LPCT::Commands::MainCommand < Clamp::Command
  
  default_subcommand "build", "Build HTML from destination and taxonomy XML", LPCT::Commands::BuildCommand
  
end