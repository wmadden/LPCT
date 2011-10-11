require "lpct"

describe( LPCT::Models::Taxonomy ) do
  
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
      subject.keys.should == [ "355064", "355065", "355066" ]
    end
    
    describe( "a value of the hash" ) do
      
      it "should have a name" do
        subject["355064"][:name].should == "Continent"
      end
      
      it "should have children" do
        subject["355064"][:children].should == [ subject["355065"] ]
      end
      
      it "should have parents" do
        subject["355066"][:parent].should == subject["355065"]
      end
      
    end
    
  end
  
end