require 'spec_helper'

describe '#City' do

  describe '.all' do
    it('should save the city and return the city') do
      City.clear()
      expect(City.all).to(eq([]))

    end
  end

  describe '#delete' do
    it "should delete a city from the database" do
      city = City.new({:name => 'thomas_the_guy', :city_id => nil})
      city.save
      city.delete
      expect(City.all).to(eq([]))
    end
  end

  describe  '#update' do
    it "should change the name of the city" do
      city = City.new({:name => 'thomas_the_guy', :city_id => nil})
      city.save
      city.update("thomas_the_gender_neutral")
      expect(city.name).to(eq("thomas_the_gender_neutral"))
    end
  end

end
