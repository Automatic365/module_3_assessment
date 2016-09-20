require 'rails_helper'

describe 'Items API' do
  it "shows all the items" do

    item = Item.create(name: "Thing1")
    item2 = Item.create(name: "Thing2")

    get '/api/v1/items'

    parsed = JSON.parse(response.body)

    expect(parsed.length).to eq(2)
    expect(parsed.first['name']).to eq("Thing1")
  end
end
