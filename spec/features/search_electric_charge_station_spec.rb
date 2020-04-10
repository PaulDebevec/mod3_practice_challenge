require 'rails_helper'

RSpec.describe "As a visitor when I visit the home page" do
  it 'When I select Turing from dropdown I am redirected to /search ' do
    visit '/'
    click_button 'Find Nearest Station'
    expect(current_path).to eq('/search')
    within(first('.station')) do
      expect(page).to have_content('.name')
    end

    within(first(".station")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel_type")
      expect(page).to have_css(".access_times")
    end
  end
end

# As a user
# When I visit "/"
# And I select "Turing" form the start location drop down (Note: Use the existing search form)
# And I click "Find Nearest Station"
# Then I should be on page "/search"
# Then I should see the closest electric fuel station to me.
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Access Times
# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1 min)
# - The direction instructions to get to that fuel station
#   "Turn left onto Lawrence St Destination will be on the left"
