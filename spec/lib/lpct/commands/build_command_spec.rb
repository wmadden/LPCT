require "lpct"
require "lpct/commands/build_command"

describe( LPCT::Commands::BuildCommand ) do
  
  let(:args) { [ destinations_file_path, taxonomy_file_path ] }
  let(:command) { LPCT::Commands::BuildCommand.new("") }
  
  describe('#run') do
    
    let(:destinations_file_path) { 'destinations.xml' }
    let(:taxonomy_file_path)     { 'taxonomy.xml' }
    let(:generator)              { mock( LPCT::SiteGenerator, :generate => nil ) }
    
    subject { command.parse(args); command.execute }
    
    before do
      LPCT::Models::Taxonomy.stub!(:load)
      LPCT::SiteGenerator.stub!(:new).and_return( generator )
    end
    
    it "should load the taxonomy" do
      LPCT::Models::Taxonomy.should_receive(:load).with( taxonomy_file_path )
      subject
    end
    
    it "should generate the site" do
      generator.should_receive(:generate)
      subject
    end
    
  end
  
end