class ForecastFacade
  def self.weather_by_zip(zip)
    info = WeatherService.by_zip(zip)
    Forecast.new(info)
  end
end
