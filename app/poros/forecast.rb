require 'date'

class Forecast
  attr_reader :summary, :temp, :temp_min, :temp_max, :date, :image_url

  def initialize(info, gif)
    @temp = convert_k_to_f_temp(info[:main][:temp])
    @temp_min = convert_k_to_f_temp(info[:main][:temp_min])
    @temp_max = convert_k_to_f_temp(info[:main][:temp_max])
    @summary = info[:weather][0][:description]
    @date = DateTime.now.new_offset(info[:timezone])
    @image_url = gif
  end

  def formatted_date
    date.strftime('%A, %B%e')
  end

  def convert_k_to_f_temp(kelvin)
    temp = ((kelvin - 273.15) * 9/5 + 32).round
    temp.to_s + '°F'
  end
end
