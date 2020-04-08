
class Seed
  def self.start
    seed = Seed.new
    seed.generate_destinations
  end

  def generate_destinations
    50.times do |i|
      dest = Destination.create!(
        name: Faker::Address.city,
        zip: Faker::Address.zip,
        description: Faker::Lorem.sentence,
        image_url: Faker::Placeholdit.image
      )
      puts "Destination #{i}: #{dest.name} created!"
    end
  end
end

Seed.start
