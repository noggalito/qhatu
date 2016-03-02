# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  titulo     :string
#  imagen     :string
#  precio     :float
#  detalle    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "factory" do
    let(:item) { build :item }

    it "Can be instantiated" do
      expect(item).to be_an_instance_of(Item)
    end

    it "Can be saved successfully" do
      item.save
      expect(item).to be_persisted
    end
  end
end
