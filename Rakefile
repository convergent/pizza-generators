require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('pizza-generators', '0.0.1') do |p|
  p.project        = "pizzagenerators"
  p.description    = "A collection of useful generator scripts for Rails."
  p.url            = "http://github.com/iain/pizza-generators"
  p.author         = 'Ryan Bates, Iain Hecker'
  p.email          = "iain@iain.nl"
  p.ignore_pattern = ["script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
