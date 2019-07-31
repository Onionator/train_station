require('sinatra')
require('sinatra/reloader')
require('pry')
require("pg")
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "train_station"})

get ('/')do
  erb :index
end
