require 'rails_helper'

RSpec.feature 'User can see a store page' do
  scenario 'they see info about the store' do
    VCR.use_cassette("store") do
# As a user
# After I have searched a zip code for stores
# When I click the name of a store
visit store_path("1118")
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



      within('h1') do
        expect(page).to have_content('Hato Rey')
      end

      within('h3') do
        expect(page).to have_content('Store Type: BigBox')
      end

      within('h4') do
        expect(page).to have_content('Address: 230 Calle Federico Costa Hato Rey, San Juan, PR 00918')
      end

      expect(page).to have_content('Mon: 10am-9pm')
    end
  end
end
