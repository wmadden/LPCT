require "lpct"

describe( LPCT::SiteGenerator ) do
  
  let(:destinations_doc) do
    Nokogiri::XML %(
      <destinations>
        <destination atlas_id="355064">
          Some Destination
        </destination>
        <destination atlas_id="123456">
          Some Other Destination
        </destination>
      <destinations>
    )
  end
  let(:taxonomy_doc)     { stub(:taxonomy_doc) }
  let(:generator)        { LPCT::SiteGenerator.new }
  
  describe("#parse_xml") do
    
    subject { generator.parse_xml( destinations_doc, taxonomy_doc ) }
    
    it "should create a hash of destination IDs to destination objects" do
      subject
      generator.destinations["355064"].xml.content.strip.should == "Some Destination"
      generator.destinations["123456"].xml.content.strip.should == "Some Other Destination"
    end
    
  end
  
end