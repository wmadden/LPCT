class LPCT::Models::Destination
  
  attr_accessor :id
  attr_accessor :xml
  attr_accessor :related_destinations
  
  def initialize( attrs )
    @related_destinations = []
    
    attrs.each do |key, value|
      self.send( :"#{key}=", value )
    end
  end
  
  def self.parse( xml )
    return new({
      :id  => xml["atlas_id"],
      :xml => xml
    })
  end
  
end