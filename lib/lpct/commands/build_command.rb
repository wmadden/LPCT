require "clamp"
require "nokogiri"

class LPCT::Commands::BuildCommand < Clamp::Command
  
  parameter "DESTINATIONS", "An XML file detailing destinations", :default => "destinations.xml"
  parameter "TAXONOMY", "An XML file describing the relationships between destinations", :default => "taxonomy.xml"
  
  def execute
    destinations_file = File.open( destinations )
    Nokogiri::XML( destinations_file )
    
    taxonomy_file = File.open( taxonomy )
    Nokogiri::XML( taxonomy_file )
  end
  
end