require "clamp"
require "nokogiri"

class LPCT::Commands::BuildCommand < Clamp::Command
  
  parameter "DESTINATIONS_FILE", "An XML file detailing destinations", :default => "destinations.xml"
  parameter "TAXONOMY_FILE", "An XML file describing the relationships between destinations", :default => "taxonomy.xml"
  parameter "OUTPUT_DIR", "The location output files should be written to", :default => "out/"
  
  def execute
    taxonomy = LPCT::Models::Taxonomy.load( taxonomy_file )
    
    site_generator = LPCT::SiteGenerator.new( File.join(File.dirname(__FILE__), '..', '..', '..', 'assets', 'destination_template.html.erb'), taxonomy )
    site_generator.generate( destinations_file, output_dir )
  end
  
end