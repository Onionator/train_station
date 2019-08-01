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
      cities.push(City.new({:name => name, :city_id => id}))
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

  def the_real_trains(destination_id)
    returned_trains_current_location = DB.exec("SELECT * FROM stops WHERE city_id = #{@city_id};")
    returned_trains_destination = DB.exec("SELECT * FROM stops WHERE city_id = #{destination_id.to_i};")
    trains = []
    # returned_trains_current_location.each do |first_choice|
    #   first_train_id = first_choice.fetch("train_id")
    #   returned_trains_destination.each do |second_choice|
    #     p "first #{first_train_id}"
    #     p "second #{second_choice.fetch("train_id")}"
    #     if first_train_id == second_choice.fetch("train_id")
    #       second_choice_city_id = second_choice.fetch("city_id")
    #       if second_choice_city_id == destination_id && @city_id ==
    #         p first_train_id, second_choice.fetch("train_id")
    #         matching_train = DB.exec("SELECT * FROM trains WHERE train_id = #{first_train_id};")
    #         p matching_train.first.fetch("name")
    #         trains.push(matching_train.first.fetch("name"))
    #       end
    #     end
    #   end
    # end
    returned_trains_current_location.each do |train|
      train_id = train.fetch("train_id")
      train_city_ids = DB.exec("SELECT city_id FROM stops WHERE train_id = #{train_id};").values
      if train_city_ids.include?([destination_id.to_s])
        matching_train = DB.exec("SELECT * FROM trains WHERE train_id = #{train_id};")
        trains.push(matching_train.first.fetch("name"))
      end
    end
    trains
  end
end
