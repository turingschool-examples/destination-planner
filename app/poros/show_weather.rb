class ShowWeather
  attr_reader :date, :high, :low, :current, :summary
  
  def initialize(weather_poro_info)
    @date = DateTime.new(weather_poro_info[:dt]).to_date
    @high = convert_temp(weather_poro_info[:main][:temp_max]).round(0)
    @low = convert_temp(weather_poro_info[:main][:temp_min]).round(0)
    @current = convert_temp(weather_poro_info[:main][:temp]).round(0)
    @summary = weather_poro_info[:weather][0][:description]
    #convert temp in poro
  end

  def convert_temp(temp)
    (temp - 273.15) * 1.8 + 32
  end
end
