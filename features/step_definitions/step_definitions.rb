Given /^I have described the following destination in XML$/ do |string|
  @destinations << YAML.load(string)
end

Given /^I have not described any relationships between destinations$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I invoke the processor without input files$/ do
  invoke!
end

When /^I invoke the processor$/ do
  # Save XML files
  write_destinations_xml
  write_taxonomy_xml
  invoke! TEST_DESTINATION_FILE, TEST_TAXONOMY_FILE, TEST_OUTPUT_DIR
end

Then /^I should see a destination file called "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I open the destination "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the heading "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a usage message$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I invoke the processor with valid input files$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^some output files should be created$/ do
  pending # express the regexp above with the code you wish you had
end
