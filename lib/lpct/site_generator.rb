class LPCT::SiteGenerator
  
  attr_accessor :destinations
  
  def parse_xml( destinations_doc, taxonomy_doc )
    @destinations = {}
    destinations_doc.root.elements.each do |destination|
      @destinations[ destination["atlas_id"] ] = destination
    end
  end
  
end