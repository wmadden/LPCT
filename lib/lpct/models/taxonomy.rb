class LPCT::Models::Taxonomy
  
  attr_reader :nodes
  
  def self.load( xml_file_path )
    self.parse( Nokogiri::XML( File.open(xml_file_path) ) )
  end
  
  def self.parse( xml_document )
    result = new
    
    top_level_xml_nodes = xml_document.xpath("/taxonomies/taxonomy/node")
    
    result.parse_nodes( top_level_xml_nodes )
    result
  end
  
  def parse_nodes( xml_nodes, parent_node = nil )
    node_objects = xml_nodes.map do |xml_node|
      node_object = {
        :id     => xml_node["atlas_node_id"],
        :name   => xml_node.xpath("node_name").first.text,
        :parent => parent_node
      }
      
      @nodes[ node_object[:id] ] = node_object
      
      node_object[:children] = parse_nodes( xml_node.xpath("node"), node_object )
      node_object
    end
    
    node_objects
  end
  
  def ancestors_of( node )
    return [] if node.nil? || node[:parent] == nil
    [ node[:parent] ] + ancestors_of( node[:parent] )
  end
  
private
  
  def initialize
    @nodes = {}
  end
  
end