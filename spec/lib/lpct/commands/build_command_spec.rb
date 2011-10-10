require "lpct"
require "lpct/commands/build_command"

describe( LPCT::Commands::BuildCommand ) do
  
  let(:args) { [] }
  let(:command) { LPCT::Commands::BuildCommand.new("") }
  
  describe('#run') do
    
    let(:destinations_file_path) { 'destinations.xml' }
    let(:taxonomy_file_path)     { 'taxonomy.xml' }
    
    let(:destinations_file_descriptor) { stub(:destinations_file) }
    let(:taxonomy_file_descriptor)     { stub(:taxonomy_file) }
    
    before do
      File.stub!(:open).and_return( destinations_file_descriptor, taxonomy_file_descriptor )
    end
    
    subject { command.execute }
    
    it "should parse the input files with Nokogiri" do
      Nokogiri.should_receive(:XML).with( destinations_file_descriptor )
      Nokogiri.should_receive(:XML).with( taxonomy_file_descriptor )
      subject
    end
    
  end
  
end