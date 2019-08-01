require('sinatra')
require('sinatra/reloader')
require('pry')
require("pg")
require('./lib/city')
require('./lib/stops')
require('./lib/train')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "train_station"})

get ('/')do
  @cities = City.all
  erb :index
end

post ('/buy_ticket') do
  @current_location = params[:current_location]
  @future_location_barring_train_crash = params[:future_location_barring_train_crash]
  city1 = DB.exec("SELECT * FROM cities WHERE name = '#{@current_location}';")
  city = City.new({:name => city1.first.fetch("name"), :city_id => city1.first.fetch("city_id")})
  city2 = DB.exec("SELECT * FROM cities WHERE name = '#{@future_location_barring_train_crash}';")
  @trains = city.the_real_trains(city1.first.fetch("city_id"))
  erb :new_rider
end
