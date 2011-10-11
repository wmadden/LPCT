Given /^I have not described any relationships between destinations$/ do
  @taxonomy = ""
end

Given /^there is a destinations file containing$/ do |string|
  @destinations = string
end

When /^I invoke the processor without input files$/ do
  invoke!
end

When /^I invoke the processor(?: with valid input files)?$/ do
  write_destinations_xml
  write_taxonomy_xml
  invoke! TEST_DESTINATION_FILE, TEST_TAXONOMY_FILE, TEST_OUTPUT_DIR
end

When /^I open the destination "([^"]*)"$/ do |arg1|
  @destination_html = File.read("#{TEST_OUTPUT_DIR}/#{arg1}.html")
end

Then /^I should see an error message in the console$/ do
  @console_output.should include("ERROR")
end

Then /^I shouldn't see any output in the console$/ do
  @console_output.should == ""
end

Then /^some output files should be created$/ do
  Dir.glob("#{TEST_OUTPUT_DIR}/*.html").should_not be_empty
end

Then /^I should see a destination file called "([^"]*)"$/ do |arg1|
  File.should exist("#{TEST_OUTPUT_DIR}/#{arg1}")
end

Then /^I should see the heading "([^"]*)"$/ do |arg1|
  @destination_html.should include(arg1)
end

Then /^I should see "([^"]*)"$/ do |arg1|
  @destination_html.should include(arg1)
end