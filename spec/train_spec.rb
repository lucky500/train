require('rspec')
require('pg')
require('train')
require('pry')

DB = PG.connect({:dbname => 'train_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM trains *;")
  end
end

describe("Train") do
  describe(".all") do
    it("starts off with no trains") do
      expect(Train.all).to(eq([]))
    end
  end

  describe("#name") do
    it("tells the train name") do
      train = Train.new({:name => "Paris", :id => nil})
      expect(train.name()).to(eq("Paris"))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      train1 = Train.new({:name => "Milan", :id => nil})
      train2 = Train.new({:name => "Milan", :id => nil})
      expect(train1).to(eq(train2))
    end
  end

  desc

  # describe("#save") do
  #   it("lets you save a train to the database") do
  #     train = Train.new({:name => "London", :id => nil})
  #     train.save()
  #     expect(Train.all()).to(eq([train]))
  #   end
  # end

  # describe("#save") do
  #   it("lets you save train names") do
  #     train = Train.new({:name => "Epicodus", id => nil})
  #     train.save
  #     expect(Train.all).to(eq([train]))
  #   end
  # end
end
