require 'pry'
require 'rspec'
require 'pg'
require 'city'
require 'rider'
require 'train'

DB = PG.connect({:dbname => 'train_station_test'})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM albums *;")
#     DB.exec("DELETE FROM songs *;")
#     DB.exec("DELETE FROM artists *;")
#     DB.exec("DELETE FROM albums_artists *;")
#   end
# end
