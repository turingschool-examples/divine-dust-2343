require 'rails_helper'

RSpec.describe "Flights Index Page" do
  before(:each) do
    @airline = Airline.create!(name: "Speedy")

    @flight1 = Flight.create!(number: "0001", date: "01/02/03", departure_city: "Miami", arrival_city: "Dallas", airline: @airline)
    @flight2 = Flight.create!(number: "0002", date: "04/05/06", departure_city: "Cheyenne", arrival_city: "Seattle", airline: @airline)

    @passenger1 = Passenger.create!(name: "Fred", age: 25)
    @passenger2 = Passenger.create!(name: "Frank", age: 30)

    
  end
  
  it "shows a list of all flight numbers" do
    visit "/flights"
    save_and_open_page
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)

  end
end