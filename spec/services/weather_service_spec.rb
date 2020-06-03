require 'rails_helper'

RSpec.describe WeatherService do
  context 'instance methods' do
    context '#weather_by_state' do
      it "returns weather data" do
        service = WeatherService.new
        json = service.response("46217")
        
        expect(json[:weather][0][:description]).not_to be_empty
        expect(json[:dt]).to be_a(Integer)
        expect(json[:main][:temp]).to be_a(Float)
        expect(json[:main][:temp_min]).to be_a(Float)
        expect(json[:main][:temp_max]).to be_a(Float)
      end
    end
  end
end
