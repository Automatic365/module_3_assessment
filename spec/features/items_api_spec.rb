require 'rails_helper'

RSpec.feature 'Items API' do
  it "shows all the items" do

    item = Item.create(name: "Thing1")
    item2 = Item.create(name: "Thing2")

    get 'api/v1/items'

    response = JSON.parse(response.body)

    expect(response.count).to eq(2)
    expect(response.first.name).to eq("Thing1")
  end
end
