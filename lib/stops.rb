require 'pry'

class Stop
  attr_reader :stop_id, :train_id, :city_id
  def initialize(attributes)
    @stop_id = attributes.fetch(:stop_id)
    @train_id = attributes.fetch(:train_id)
    @city_id = attributes.fetch(:city_id)
  end

  def add_stop
    DB.exec("INSERT INTO stops (train_id, city_id) VALUES (#{@train_id}, #{@city_id}) RETURNING stop_id;")
  end

  def self.all
    returned_stops = DB.exec("SELECT * FROM stops ORDER BY stop_id;")
    stops = []
    returned_stops.each do |stop|
      stop_id = stop.fetch("stop_id").to_i
      train_id = stop.fetch("train_id").to_i
      city_id = stop.fetch("city_id").to_i
      stops.push(Stop.new({:stop_id => stop_id, :train_id => train_id, :city_id => city_id}))
    end
    stops
  end
end
