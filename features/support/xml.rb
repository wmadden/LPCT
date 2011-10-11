require "nokogiri"

TEST_DESTINATION_FILE = "test_destinations.xml"
TEST_TAXONOMY_FILE    = "test_taxonomy.xml"

Before do
  @destinations = ""
  @taxonomy = ""
end

After do
  #sh( "rm #{TEST_DESTINATION_FILE} #{TEST_TAXONOMY_FILE}" )
end

def write_destinations_xml
  File.open( TEST_DESTINATION_FILE, 'w' ) do |f|
    f.write( @destinations )
  end
end

def write_taxonomy_xml
  File.open( TEST_TAXONOMY_FILE, 'w' ) do |f|
    f.write( @taxonomy )
  end
end