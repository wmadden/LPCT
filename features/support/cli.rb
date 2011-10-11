BIN      = 'lpct'
BIN_PATH = File.join( '.', 'bin', BIN )
LOG_DIR  = "test_output"
LOG_FILE = "#{ Time.now.to_s.gsub(' ', '-') }.log"

def invoke!( *args )
  system( "mkdir -p #{ LOG_DIR }")
  system( "#{BIN_PATH} build #{ args.join(' ') } > #{ File.join( LOG_DIR, LOG_FILE ) } 2>&1" )
  @console_output = File.read( File.join(LOG_DIR, LOG_FILE) )
end