require "lpct/commands/app_command"

describe( LPCT::Commands::AppCommand ) do
  
  let(:args) { [] }
  subject { LPCT::Commands::AppCommand.run("", args) }
  
  before do
    LPCT::Commands::BuildCommand.stub(:run)
  end
  
  it "should run the build command by default" do
    LPCT::Commands::BuildCommand.should_receive(:run)
    subject
  end
  
end