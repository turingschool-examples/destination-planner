class WeatherService
  def self.by_zip(zip)
    get_json("weather?zip=#{zip}")
  end

  private

  def self.conn
    conn = Faraday.new('https://api.openweathermap.org/data/2.5') do |f|
      f.params[:APPID] = ENV['WEATHER_APPID']
    end
  end

  def self.get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
