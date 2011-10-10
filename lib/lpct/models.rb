module LPCT::Models
end

Dir.glob( File.join(File.dirname(__FILE__), 'models', '*') ).each do |model_file|
  require model_file
end