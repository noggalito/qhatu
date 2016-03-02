require 'rails_helper'

RSpec.describe Item, type: :model do

  it "Can be instantiated" do
    expect(Item.new).to be_an_instance_of(Item)
  end

  it "Can be saved successfully" do
    expect(Item.create).to be_persisted
  end

end
