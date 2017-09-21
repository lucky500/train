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

#2
describe("Train") do
  describe(".all") do
    it("starts off with no trains") do
      expect(Train.all).to(eq([]))
    end
  end

#1
  describe("#name") do
    it("tells the train name") do
      train = Train.new({:name => "Paris", :id => nil})
      expect(train.name()).to(eq("Paris"))
    end
  end

#5
  describe("#id") do
    it("sets its ID when you save it") do
      train = Train.new({:name => "Epicodus stuff", :id => nil})
      train.save()
      expect(train.id()).to(be_an_instance_of(Fixnum))
    end
  end

#4
  describe("#save") do
    it("lets you save a train to the database") do
      train = Train.new({:name => "London", :id => nil})
      train.save()
      expect(Train.all()).to(eq([train]))
    end
  end

#3
  describe("#==") do
    it("is the same list if it has the same name") do
      train1 = Train.new({:name => "Milan", :id => nil})
      train2 = Train.new({:name => "Milan", :id => nil})
      expect(train1).to(eq(train2))
    end
  end

end
