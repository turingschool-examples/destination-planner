require 'rails_helper'

RSpec.describe "Destination Weather API" do
  before :each do
    @destination1 = Destination.create!(
      name: 'Centennial',
      zip: 80112,
      description: "Yup. it's Suburbia!",
      image_url: Faker::Placeholdit.image
    )
    @destination2 = Destination.create!(
      name: 'Denver',
      zip: 80210,
      description: "No, it's *8* 0210",
      image_url: Faker::Placeholdit.image
    )
  end
  it "sends a list of destinations weather" do
    get '/api/v1/destinations'

    parsed = JSON.parse(response.body, symbolize_names: true)
    destinations_weather = parsed[:data]

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')
    expect(destinations_weather.count).to eq(2)
    destinations_weather.each do |destination|
      expect(destination[:type]).to eq('destination-weather')
    end
    expect(destinations_weather.first[:id]).to eq(@destination1.id)
    expect(destinations_weather.first[:attributes][:name]).to eq(@destination1.name)
    expect(destinations_weather.first[:attributes][:zip]).to eq(@destination1.zip)
    expect(destinations_weather.first[:attributes][:description]).to eq(@destination1.description)
  end

end
