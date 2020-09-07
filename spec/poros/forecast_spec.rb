require 'rails_helper'

RSpec.describe Forecast do
  before :each do
    @info = {
      "coord": {
          "lon": -104.9,
          "lat": 39.58
      },
      "weather": [
          {
              "id": 500,
              "main": "Rain",
              "description": "sunny",
              "icon": "10d"
          }
      ],
      "base": "stations",
      "main": {
          "temp": 305.37,
          "feels_like": 303.37,
          "temp_min": 291.483,
          "temp_max": 308.15,
          "pressure": 1023,
          "humidity": 7
      },
      "visibility": 10000,
      "wind": {
          "speed": 2.1,
          "deg": 0
      },
      "rain": {
          "1h": 0.51
      },
      "clouds": {
          "all": 20
      },
      "dt": 1599424446,
      "sys": {
          "type": 1,
          "id": 3292,
          "country": "US",
          "sunrise": 1599395587,
          "sunset": 1599441767
      },
      "timezone": -21600,
      "id": 0,
      "name": "Englewood",
      "cod": 200
    }
    @gif = "https://media1.giphy.com/media/KpAPQVW9lWnWU/200.gif?cid=3230edd1i7rnuxyrr7na5qzyptow0v6yl1rzg1l5e7odrocd&rid=200.gif"
    @forecast = Forecast.new(@info, @gif)
  end
  it 'can be initialized with attributes' do
    date = DateTime.now.new_offset(@info[:timezone])

    expect(@forecast).to be_instance_of(Forecast)
    expect(@forecast.temp).to eq('90°F')
    expect(@forecast.temp_max).to eq('95°F')
    expect(@forecast.temp_min).to eq('65°F')
    expect(@forecast.date).to be_instance_of(DateTime)
    expect(@forecast.date.offset).to eq(date.offset)
    expect(@forecast.summary).to eq('sunny')
    expect(@forecast.image_url).to eq(@gif)
  end
   it "can format date" do
   date = DateTime.now.new_offset(@info[:timezone])
   expected = date.strftime('%A, %B%e')
   expect(@forecast.formatted_date).to eq(expected)
  end
  it "can convert temperatures" do
    expect(@forecast.temp).to eq('90°F')
    expect(@forecast.temp_max).to eq('95°F')
    expect(@forecast.temp_min).to eq('65°F')
  end
end
