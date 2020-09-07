class ForecastFacade
  def self.weather_by_zip(zip)
    info = WeatherService.by_zip(zip)
    gif_info = GifService.image_by_description(info[:weather][0][:description])
    gif = gif_info[:images][:fixed_height][:url]
    Forecast.new(info, gif)
  end
end
