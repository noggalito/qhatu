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
  subject { item }

  describe "factory" do
    let(:item) { build :item }

    it "Can be instantiated" do
      is_expected.to be_an_instance_of(Item)
    end

    it "Can be saved successfully" do
      item.save
      is_expected.to be_persisted
    end
  end

  describe ":precio" do
    let(:item) {
      build :item, precio: precio
    }

    context "not a number" do
      let(:precio) { "some value" }
      it { is_expected.to_not be_valid }
    end

    context "precio 0" do
      let(:precio) { 0 }
      it { is_expected.to_not be_valid }
    end

    context "more than 0" do
      let(:precio) { 2.99 }
      it { is_expected.to be_valid }
    end

    context "price inside string" do
      let(:precio) { "2.99" }
      it { is_expected.to be_valid }
    end
  end
end
