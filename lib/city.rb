require 'pry'

class City
  attr_accessor :name
  attr_reader :city_id
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @city_id = attributes.fetch(:city_id)
  end

  def save
    city = DB.exec("INSERT INTO cities (name) VALUES ('#{@name}') RETURNING city_id;")
    @city_id = city.first.fetch("city_id").to_i
  end

  def self.all
    returned_cities = DB.exec("SELECT * FROM cities ORDER BY name;")
    cities = []
    returned_cities.each do |city|
      name = city.fetch("name")
      id = city.fetch("city_id").to_i
      cities.push(Train.new({:name => name, :city_id => id}))
    end
    cities
  end

  def self.clear
    DB.exec("DELETE FROM cities *")
  end

  def delete
    DB.exec("DELETE FROM cities WHERE city_id = #{@city_id};")
  end

  def update(name)
    @name = name
    DB.exec("UPDATE cities SET name = '#{@name}' WHERE city_id = #{@city_id};")
  end

  # def trains
  #   travel_info = []
  #   returned_trains = DB.exec("SELECT * FROM stops WHERE city_id = #{@city_id};")
  #   returned_trains.each do |train|
  #     array = []
  #     train_id = train.fetch("train_id")
  #     returned_cities = DB.exec("SELECT * FROM stops WHERE train_id = #{train_id};")
  #     current_train = DB.exec("SELECT FROM trains WHERE train_id = #{train_id};")
  #     array.push(current_train.fetch("name"))
  #     returned_cities do |city|
  #       current_city = DB.exec("SELECT FROM cities WHERE city_id = #{city.fetch("city_id")};")
  #       array.push(current_city.fetch("name"))
  #     end
  #     travel_info.push(array)
  #   end
  # end

  def the_real_trains(destination_id)
    returned_trains_current_location = DB.exec("SELECT * FROM stops WHERE city_id = #{@city_id};")
    returned_trains_destination = DB.exec("SELECT * FROM stops WHERE city_id = #{destination_id};")
    trains = []
    returned_trains_current_location.each do |first_choice|
      first_train_id = first_choice.fetch("train_id")
      returned_trains_destination.each do |second_choice|
        if first_train_id == second_choice.fetch("train_id")
          matching_train = DB.exec("SELECT * FROM trains WHERE train_id = #{first_train_id};")
          trains.push(matching_train.fetch("name"))
        end
      end
    end
    trains
  end
end
