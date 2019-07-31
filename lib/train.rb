require 'pry'

class Train
  attr_accessor :name
  attr_reader :train_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @train_id = attributes.fetch(:train_id)
  end

  def save
    train = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING train_id;")
    @train_id = train.first.fetch("train_id").to_i
  end

  def self.all
    returned_trains = DB.exec("SELECT * FROM trains ORDER BY name;")
    trains = []
    returned_trains.each do |train|
      name = train.fetch("name")
      id = train.fetch("train_id").to_i
      trains.push(Train.new({:name => name, :train_id => id}))
    end
    trains
  end

  def self.clear
    DB.exec("DELETE FROM trains *")
  end

  def delete
    DB.exec("DELETE FROM trains WHERE train_id = #{@train_id};")
  end

  def update(name)
    @name = name
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE train_id = #{@train_id};")
  end


end
