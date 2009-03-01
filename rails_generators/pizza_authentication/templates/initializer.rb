require 'factory_girl'

Dir.glob(RAILS_ROOT+'/app/factories/*.rb') do |file|
  require file
end
