require "lpct"

describe( LPCT::Models::Destination ) do
  
  describe("#parse") do
    
    let(:xml) do
      Nokogiri::XML( %(
        <destination atlas_id="355064">
          Some Destination
        </destination>
      )).root
    end
    subject { LPCT::Models::Destination.parse(xml) }
    
    it "should create a new Destination with parsed properties" do
      LPCT::Models::Destination.should_receive(:new).with({
        :id => "355064",
        :xml => xml
      })
      subject
    end
    
  end
  
end