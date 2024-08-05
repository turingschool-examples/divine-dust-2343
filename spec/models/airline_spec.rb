require "rails_helper"

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it { should have_many :flights }
    it { should have_many(:passengers).through(:flights) }
  end

  describe "instance methods" do 
    it "can product distinct list of all airline passengers" do 
      @airline1 = Airline.create!(name: "Spirit")
      @flight1 = @airline1.flights.create!(number: 735, 
                                        date: "05/10/24", 
                                        departure_city: "Nashville",
                                        arrival_city: "New York")
      @flight2 = @airline1.flights.create!(number: 346, 
                                        date: "08/10/24", 
                                        departure_city: "San Diego",
                                        arrival_city: "Milwaukee")
      @passenger1 = Passenger.create!(name: "Diane", age: 87)
      @passenger2 = Passenger.create!(name: "Laura", age: 63)
      @passenger3 = Passenger.create!(name: "Dora", age: 12)
      @passenger4 = Passenger.create!(name: "Millie", age: 38)
      @passenger5 = Passenger.create!(name: "Leah", age: 10)
      @passenger6 = Passenger.create!(name: "Humphry", age: 6)
      FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
      FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
      FlightPassenger.create!(flight: @flight1, passenger: @passenger3)
      FlightPassenger.create!(flight: @flight2, passenger: @passenger1)
      FlightPassenger.create!(flight: @flight2, passenger: @passenger5)
      FlightPassenger.create!(flight: @flight2, passenger: @passenger6)

      @airline2 = Airline.create!(name: "United")
      @flight3 = @airline2.flights.create!(number: 73, 
                                        date: "05/15/24", 
                                        departure_city: "Nashville",
                                        arrival_city: "New York")
      @passenger7 = Passenger.create!(name: "Humphry", age: 6)
      @passenger8 = Passenger.create!(name: "Snoy", age: 26)
      FlightPassenger.create!(flight: @flight3, passenger: @passenger7)
      FlightPassenger.create!(flight: @flight3, passenger: @passenger8)

      expect(@airline1.adult_passenger_list).to eq([@passenger1, @passenger2])
    end
  end
end
