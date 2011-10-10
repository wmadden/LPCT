class LPCT::SiteGenerator
  
  attr_accessor :destinations
  
  def parse_xml( destinations_doc, taxonomy_doc )
    @destinations = {}
    destinations_doc.root.elements.each do |destination_xml|
      @destinations[ destination_xml["atlas_id"] ] = {
        :xml => destination_xml,
        :related_destinations => []
      }
    end
  end
  
end