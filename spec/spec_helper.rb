require 'pry'
require 'rspec'
require 'pg'
require 'city'
require 'train'
require 'stops'

DB = PG.connect({:dbname => 'train_station_test'})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM trains *;")
#     DB.exec("DELETE FROM cities *;")
#   end
# end
