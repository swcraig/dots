begin
  require 'pry'
  Pry.start
  exit
rescue LoadError => e
  warn '=> Unable to load pry. Using irb instead.'
end
