require "lpct"
require "lpct/commands/build_command"

describe( LPCT::Commands::BuildCommand ) do
  
  let(:args) { [] }
  subject { LPCT::Commands::BuildCommand.run("", args) }
  
end