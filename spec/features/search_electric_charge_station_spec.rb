require 'rails_helper'

RSpec.describe "As a visitor when I visit the home page" do
  it 'When I select Turing from dropdown I am redirected to /search ' do
    visit '/'
    click_button 'Find Nearest Station'
    expect(current_path).to eq('/search')

    within(first(".station")) do
      expect(page).to have_css(".station_name")
      expect(page).to have_css(".street_address")
      expect(page).to have_css(".fuel_type_code")
      expect(page).to have_css(".access_days_time")
    end
  end
end

# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1 min)
# - The direction instructions to get to that fuel station
#   "Turn left onto Lawrence St Destination will be on the left"
