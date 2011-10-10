require "nokogiri"

TEST_DESTINATION_FILE = "test_destinations.xml"
TEST_TAXONOMY_FILE    = "test_taxonomy.xml"

Before do
  @destinations = []
  @taxonomy = []
end

After do
  #sh( "rm #{TEST_DESTINATION_FILE} #{TEST_TAXONOMY_FILE}" )
end

def write_destinations_xml
  builder = Nokogiri::XML::Builder.new do |xml|
    xml.root {
      xml.destinations {
        @destinations.each do |destination|
          xml.destination {
            destination.each do |key, value|
              xml.key value
            end
          }
        end
      }
    }
  end
  puts builder.to_xml
end

def write_taxonomy_xml
end