class LPCT::Models::Taxonomy
  
  def self.parse( xml_document )
    result = {}
    
    nodes = xml_document.xpath("/taxonomies/taxonomy/node")
    
    parse_nodes( nodes )[:existing_node_hash]
  end
  
private
  
  def self.parse_nodes( xml_nodes, parent_node = nil, existing_node_hash = {} )
    nodes = xml_nodes.map do |xml_node|
      node_object = {
        :id     => xml_node["atlas_node_id"],
        :name   => xml_node.xpath("node_name").first.text,
        :parent => parent_node
      }
      
      existing_node_hash[ node_object[:id] ] = node_object
      
      node_object[:children] = parse_nodes( xml_node.xpath("node"), node_object, existing_node_hash )[:nodes]
      node_object
    end
    
    {
      :nodes => nodes,
      :existing_node_hash => existing_node_hash
    }
  end
  
end