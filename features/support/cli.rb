def invoke!( *args )
  system( "./bin/lpct #{ args.join(' ') }" )
end