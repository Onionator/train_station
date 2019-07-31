require 'spec_helper'

describe '#Train' do

  describe '.all' do
    it('should save the train and return the train') do
      Train.clear()
      expect(Train.all).to(eq([]))

    end
  end

  # describe '#save' do
  #   it('should save the train') do
  #     train = Train.new({:name => 'thomas_the_guy', :train_id => nil})
  #     expect(train.save()).to(eq(7))
  #
  #   end
  # end

  describe '#delete' do
    it "should delete a train from the database" do
      train = Train.new({:name => 'thomas_the_guy', :train_id => nil})
      train.save
      train.delete
      expect(Train.all).to(eq([]))
    end
  end

  describe  '#update' do
    it "should change the name of the train" do
      train = Train.new({:name => 'thomas_the_guy', :train_id => nil})
      train.save
      train.update("NO DAN")
      expect(train.name).to(eq("NO DAN"))
    end
  end

end
