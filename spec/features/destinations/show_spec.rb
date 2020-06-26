require 'rails_helper'

RSpec.describe "As a user," do 
  context "when I visit the root path, I can click on a destination and see a show page" do 
    it "and it will display a weather forecast specific to the selected destination including date, current, high, and low temps, and a summary." do 
      destination = Destination.create!(name: 'Indianapolis, IN', 
                                        zip: 46217, 
                                        description: "This is a description.", 
                                        image_url: 'https://media-cdn.tripadvisor.com/media/photo-s/06/d7/dc/ac/bigphotoforindianapolis.jpg'
                                       )
      visit "/"
      
      within "#destination-#{destination.id}" do
        click_on "Show"
      end
      
       within(first(".weather-api")) do
        expect(page).to have_css(".high")
        expect(page).to have_css(".low")
        expect(page).to have_css(".date")
        expect(page).to have_css(".current")
        expect(page).to have_css(".summary")
      end
      #verify in a within block that its not empty, expect wrapped classes to not be empty
    end

    it "and it will display a gif related to weather." do
      destination = Destination.create!(name: 'Indianapolis, IN', 
                                        zip: 46217, 
                                        description: "This is a description.", 
                                        image_url: 'https://media-cdn.tripadvisor.com/media/photo-s/06/d7/dc/ac/bigphotoforindianapolis.jpg'
                                       )
      
      visit "/"

      within "#destination-#{destination.id}" do
        click_on "Show"
      end
      within(first(".weather-api")) do
        expect(page).to have_css(".gif")
      end
    end
  end
end


# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see the destination's name, zipcode, description, and current weather
# The weather forecast is specific to the destination whose page I'm on
# The forecast should include date (weekday, month and day), current, high and low temps in Fahrenheit, and a summary (for example "light rain", "clear sky", etc.)


# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see an image related to the current weather at the destination
