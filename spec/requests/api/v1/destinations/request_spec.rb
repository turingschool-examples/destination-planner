require 'rails_helper'

RSpec.describe "Destination API" do
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
  it "sends a list of destinations" do
    get '/api/v1/destinations'

    parsed = JSON.parse(response.body, symbolize_names: true)
    destinations = parsed[:data]

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')
    expect(destinations.count).to eq(2)
    destinations.each do |destination|
      expect(destination[:type]).to eq('destination')
    end
    expect(destinations.first[:id]).to eq(@destination1.id)
    expect(destinations.first[:attributes][:name]).to eq(@destination1.name)
    expect(destinations.first[:attributes][:zip]).to eq(@destination1.zip)
    expect(destinations.first[:attributes][:description]).to eq(@destination1.description)
  end
  it "can return a single destination" do
    get "/api/v1/destinations/#{@destination1.id}"

    parsed = JSON.parse(response.body, symbolize_names: true)
    destination = parsed[:data]

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')
    expect(destination.count).to eq(1)
    expect(destination[:type]).to eq('destination')
    expect(destination[:id]).to eq(@destination1.id)
    expect(destination[:attributes][:name]).to eq(@destination1.name)
    expect(destination[:attributes][:zip]).to eq(@destination1.zip)
    expect(destination[:attributes][:description]).to eq(@destination1.description)
  end
end
