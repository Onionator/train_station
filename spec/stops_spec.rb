require 'spec_helper'

describe 'Stop' do
  it "will add a stop" do
    city = City.new({:name => 'Portland', :city_id => nil})
    city.save
    train = Train.new({:name => 'A', :train_id => nil})
    train.save
    stop = Stop.new({:stop_id => nil, :train_id => train.train_id, :city_id => city.city_id})
    stop.add_stop
    temp = Stop.all
    expect(temp[0].stop_id).to(eq(1))
  end
end

describe 'Stop' do
  it "will return an array of trains to take." do
    city = City.new({:name => 'Portland', :city_id => nil})
    city.save
    train = Train.new({:name => 'A', :train_id => nil})
    train.save
    stop = Stop.new({:stop_id => nil, :train_id => train.train_id, :city_id => city.city_id})
    stop.add_stop
    city2 = City.new({:name => 'Seattle', :city_id => nil})
    city2.save
    stop2 = Stop.new({:stop_id => nil, :train_id => train.train_id, :city_id => city2.city_id})
    stop2.add_stop
    expect(city.the_real_trains(city2.city_id)).to(eq(["A"]))
  end
end
