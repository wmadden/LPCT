require "lpct"

describe( LPCT::SiteGenerator ) do
  
  let(:taxonomy)  { mock(LPCT::Models::Taxonomy) }
  let(:generator) { LPCT::SiteGenerator.new("destination_template", taxonomy) }
  let(:template)  { stub(:erb_template) }
  
  before do
    File.stub!(:read)
    ERB.stub!(:new).and_return( template )
  end
  
  describe("#generate") do
    
    let(:reader) do
      Nokogiri::XML::Reader.from_memory( %(
        <destinations>
          <destination atlas_id="355064">
            Some Destination
          </destination>
          <destination atlas_id="123456">
            Some Other Destination
          </destination>
        </destinations>
      ))
    end
    let(:destinations_file) { "some_file.xml" }
    
    subject { generator.generate( destinations_file ) }
    
    before do
      generator.stub!(:parse_destination_xml)
      generator.stub!(:generate_destination_html_for)
      File.stub!(:open)
      Nokogiri::XML::Reader.stub!(:from_io).and_return( reader )
    end
    
    it "should read the destinations XML using Nokogiri" do
      file_descriptor = stub( :file_descriptor )
      File.should_receive(:open).with( destinations_file ).and_return( file_descriptor )
      Nokogiri::XML::Reader.should_receive(:from_io).with( file_descriptor ).and_return( reader )
      subject
    end
    
    it "should parse each destination" do
      generator.should_receive(:parse_destination_xml).exactly(2)
      subject
    end
    
    it "should generate html for each destination" do
      generator.should_receive(:generate_destination_html_for).exactly(2)
      subject
    end
    
  end
  
  describe("#")
  
end