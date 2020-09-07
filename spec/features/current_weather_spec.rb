require 'rails_helper'

RSpec.describe "Destination Show Page" do
  before :each do
    @destination = Destination.create!(
      name: 'Centennial',
      zip: 80112,
      description: "Yup. it's Suburbia!",
      image_url: Faker::Placeholdit.image
    )
  end

  it "displays destination info and current weather" do
    visit root_path

    click_link 'Show'

    expect(current_path).to eq(destination_path(@destination.id))

    expect(page).to have_content(@destination.name)
    expect(page).to have_content(@destination.zip)
    expect(page).to have_content(@destination.description)
    current_date = find('.current_date').text
    expect(current_date).to_not be_empty
    current_temp = find('.current_temp').text
    expect(current_temp).to_not be_empty
    high_temp = find('.high_temp').text
    expect(high_temp).to_not be_empty
    low_temp = find('.low_temp').text
    expect(low_temp).to_not be_empty
    weather_summary = find('.weather_summary').text
    expect(weather_summary).to_not be_empty
  end
  it 'displays a related gif' do
    visit root_path

    click_link 'Show'

    expect(current_path).to eq(destination_path(@destination.id))

    expect(page).to have_css("img")
  end
end

# Then I should see the destination's name, zipcode, description, and current weather
# The weather forecast is specific to the destination whose page I'm on
# The forecast should include date (weekday, month and day), current, high and low temps in Fahrenheit, and a summary (for example "light rain", "clear sky", etc.)
