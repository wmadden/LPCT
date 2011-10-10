module LPCT::Commands
end

Dir.glob( File.join(File.dirname(__FILE__), 'commands', '*') ).each do |command_file|
  require command_file
end