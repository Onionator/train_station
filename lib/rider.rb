require 'pry'

class Rider
  attr_accessor :name, :train_id
  attr_reader :rider_id
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @rider_id = attributes.fetch(:rider_id)
    @train_id = attributes.fetch(:train_id)
  end
end
