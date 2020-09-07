require 'json'

class DestinationSerializer
  def self.render(destinations)
    json = {data: []}
    destinations.each do |destination|
      formatted = {type: 'destination',
        id: destination.id,
        attributes: {
          name: destination.name,
          zip: destination.zip,
          description: destination.description,
          image: destination.image_url
        }
      }
      json[:data] << formatted
    end
    json.to_json
  end
end
