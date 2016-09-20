require 'rails_helper'

RSpec.feature 'User can search by zip code' do
  scenario 'they see a list of stores close to zip code' do
    VCR.use_cassette("stores") do
      # As a user
      # When I visit "/"
      visit root_path
      # And I fill in a search box with "80202" and click "search"
      fill_in :zipcode, with: "80202"
      click_on "Search for Stores"

      expect(page).to have_content('Search Results')
      # Then my current path should be "/search" (ignoring params)
      # And I should see stores within 25 miles of 80202
      # And I should see a message that says "17 Total Stores"
      expect(page).to have_content('17 Total Stores')
      # And I should see exactly 15 results
      # And I should see the long name, city, distance, phone number and store type for each of the 15 results
      expect(page).to have_content('Name')
      expect(page).to have_content('City')

    end
  end
end
