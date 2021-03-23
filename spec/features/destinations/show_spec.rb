require 'rails_helper'

RSpec.describe 'Destination show page', type: :feature do
  describe 'User can get current weather for destination' do
    before(:each) do
      @destination = Destination.create(
        name: 'Powhatan',
        zip: '23139',
        description: 'A beautiful backwater',
        image_url: Faker::Placeholdit.image
      )
    end

    it 'should include date, current, high, and low temps, and a summary' do
      visit root_path
      click_link 'Show'

      expect(current_path).to eq(destination_path(@destination.id))
      expect(page).to have_content(@destination.name)
      expect(page).to have_content(@destination.zip)
      expect(page).to have_content(@destination.description)

      within ".weather" do
        expect(page).to have_css('#date')
        expect(page).to have_css('#current-temp')
        expect(page).to have_css('#high-temp')
        expect(page).to have_css('#low-temp')
        expect(page).to have_css('#description')
      end
    end
  end
end