class WeatherService
  def connection 
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5') do |f|
      f.params['appid'] = ENV['WEATHER-API-KEY']
    end
  end

  def response(zip)
    response = connection.get("weather?zip=#{zip},us")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end