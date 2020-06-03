#facades named after their controller
class DestinationFacade
  def self.retrieve_forecast(zip)
    weather = WeatherService.new
    weather_poro_info = weather.response(zip)
    ShowWeather.new(weather_poro_info)
  end
end