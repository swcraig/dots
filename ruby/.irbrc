begin
  require 'pry'
  Pry.config.prompt = [proc { '' }, proc { '' }]
  Pry.start
  exit
rescue LoadError => e
  warn '=> Unable to load pry. Using irb instead.'
end
