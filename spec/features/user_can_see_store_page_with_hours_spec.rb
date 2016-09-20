require 'rails_helper'

RSpec.feature 'User can see a store page' do
  scenario 'they see info about the store' do
    VCR.use_cassette("store") do
      # As a user
      # After I have searched a zip code for stores
      # When I click the name of a store
      visit store_path("2740")
      # Then my current path should be "/stores/:store_id"
      # I should see the store name, store type and address with city, state and zip
      # I should see an unordered list of the store hours in the following format:
      #   * Mon: 10am-9pm
      #   * Tue: 10am-9pm
      #   * Wed: 10am-9pm
      #   * Thurs: 10am-9pm
      #   * Fri: 10am-9pm
      #   * Sat: 10am-9pm
      #   * Sun: 11am-7pm

      expect(page).to have_content('Cherry Creek Shopping Center')
      expect(page).to have_content('Store Type: Mobile')
      expect(page).to have_content('Address:  3000 East First Ave, Denver, CO 80206')
      # expect(page).to have_content('Mon: 10am-9pm')
    end
  end
end
