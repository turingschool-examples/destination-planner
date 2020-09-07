class DestinationSerializer
  def self.render(destinations)
    if destinations.class != Destination
      json = {data: []}
      destinations.each do |destination|
        formatted = {
          type: 'destination',
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
    else
      json = {
        data: {
          type: 'destination',
          id: destinations.id,
          attributes: {
            name: destinations.name,
            zip: destinations.zip,
            description: destinations.description,
            image: destinations.image_url
          }
        }
      }
    end
    json
  end
end
