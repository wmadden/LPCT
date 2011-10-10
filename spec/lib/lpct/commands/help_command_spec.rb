require "lpct/commands/help_command"

describe( LPCT::Commands::HelpCommand ) do
  
  let(:command) { LPCT::Commands::HelpCommand.new }
  subject { command.execute }
  
  it "should print usage" do
    Kernel.should_receive(:puts)
    subject
  end
  
end