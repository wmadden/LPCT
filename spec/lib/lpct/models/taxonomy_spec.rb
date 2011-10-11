require "lpct"

describe( LPCT::Models::Taxonomy ) do
  
  describe( "self.load" ) do
    let(:file_name) { "some_file.xml" }
    let(:fd)        { stub(:file_descriptor) }
    let(:xml)       { stub(:xml_document) }
    let(:new_tax)   { stub(:new_taxonomy) }
    
    subject         { LPCT::Models::Taxonomy.load( file_name ) }
    
    it "should parse the given XML file" do
      File.should_receive(:open).with( file_name ).and_return( fd )
      Nokogiri.should_receive(:XML).with( fd ).and_return( xml )
      LPCT::Models::Taxonomy.should_receive(:parse).with( xml ).and_return( new_tax )
      subject
    end
  end
  
  describe( "self.parse" ) do
    let(:xml_document) do
      Nokogiri::XML %(
        <taxonomies>
          <taxonomy>
            <taxonomy_name>World</taxonomy_name>
            <node atlas_node_id = "355064" ethyl_content_object_id="82534" geo_id = "355064">
              <node_name>Continent</node_name>
              <node atlas_node_id = "355065" ethyl_content_object_id="82534" geo_id = "355064">
                <node_name>Country</node_name>
                <node atlas_node_id = "355066" ethyl_content_object_id="82534" geo_id = "355064">
                  <node_name>City</node_name>
                </node>
              </node>
            </node>
          </taxonomy>
        </taxonomies>
      )
    end
    
    subject { LPCT::Models::Taxonomy.parse( xml_document ) }
    
    it "should return a hash whose keys are IDs" do
      subject.nodes.keys.should == [ "355064", "355065", "355066" ]
    end
    
    describe( "a value of the hash" ) do
      
      it "should have a name" do
        subject.nodes["355064"][:name].should == "Continent"
      end
      
      it "should have children" do
        subject.nodes["355064"][:children].should == [ subject.nodes["355065"] ]
      end
      
      it "should have parents" do
        subject.nodes["355066"][:parent].should == subject.nodes["355065"]
      end
      
    end
    
  end
  
end