require "lpct/models"
require "nokogiri"
require "erb"

class LPCT::SiteGenerator
  
  attr_accessor :destinations
  attr_accessor :taxonomy
  
  def initialize( destination_template, taxonomy )
    @template = ERB.new( File.read(destination_template) )
    @taxonomy = taxonomy
  end
  
  def generate( destinations_file )
    
    # A Nokogiri Reader reads an XML file from a stream, so we don't need to load the
    # entire thing into memory.
    reader = Nokogiri::XML::Reader.from_io( File.open(destinations_file) )
    
    reader.each do |node|
      next unless node.name == "destination"
      
      destination = parse_destination_xml( node.outer_xml )
      generate_destination_html_for destination
      
      # Skip everything until the closing tag
      reader.read until node.name == "destination" && node.node_type == Nokogiri::XML::Reader::TYPE_END_ELEMENT
    end
    
  end
  
  def generate_destination_html_for( destination )
    destination_taxonomy_node = @taxonomy.nodes[ destination[:id] ]
    ancestors = @taxonomy.ancestors_of( destination_taxonomy_node ).reverse
    children = destination_taxonomy_node[:children]
    
    file = File.open( "out/#{ destination[:id] }.html", 'w' )
    file.write( @template.result(binding) )
  end
  
  # Normalizes the destination object, so the view doesn't have to worry about missing properties etc.
  def parse_destination_xml( xml_string )
    xml = Nokogiri::XML( xml_string )
    {
      :id           => xml.root["atlas_id"],
      :title        => xml.root["title"],
      :introduction => {
        :overview   => xml.root.xpath("introductory/introduction/overview")
      },
      :history      => {
        :overview   => xml.root.xpath("history/history/overview"),
        :paras      => xml.root.xpath("history/history/history")
      },
      :practical    => {
        :health_and_safety => {
          # :dangers_and_annoyances => xml.root.xpath("history/history/overview"),
          #           :while_youre_there => xml.root.xpath("history/history/overview"),
        },
        :money_and_costs => {
          # :money => ,
          # :costs => 
        },
        :visas => {
          # :overview => 
        }
      },
    }
  end
  
end