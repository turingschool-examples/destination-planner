class ForecastFacade
  def self.weather_by_zip(zip)
    info = WeatherService.by_zip(zip)
    gif = get_gif(info[:weather][0][:description])
    Forecast.new(info, gif)
  end

  private

  def self.get_gif(weather_summary)
    gif_info = GifService.image_by_description(weather_summary)
    gif_info[:images][:fixed_height][:url]
  end
end
