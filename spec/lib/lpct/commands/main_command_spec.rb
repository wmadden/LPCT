require "lpct"
require "lpct/commands/main_command"

describe( LPCT::Commands::MainCommand ) do
  
  let(:args) { [] }
  subject { LPCT::Commands::MainCommand.run("", args) }
  
  before do
    LPCT::Commands::BuildCommand.stub(:run)
  end
  
  it "should run the build command by default" do
    LPCT::Commands::BuildCommand.should_receive(:run)
    subject
  end
  
end