class LPCT::Models::Destination
  
  attr_accessor :xml
  attr_accessor :related_destinations
  
  def initialize( attrs )
    attrs.each do |key, value|
      self.send( :"#{key}=", value )
    end
  end
  
end