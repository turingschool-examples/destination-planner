class GifService
  def self.image_by_description(weather_summary)
    get_json("search?q=#{weather_summary}")[:data][0]
  end

  private

  def self.conn
    conn = Faraday.new('https://api.giphy.com/v1/gifs') do |f|
      f.params[:api_key] = ENV['GIPHY_API_KEY']
    end
  end

  def self.get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
