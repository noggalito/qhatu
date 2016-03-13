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

RSpec.describe ItemsController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    let!(:item) { create :item }
    before { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "includes item" do
      expect(assigns(:items)).to include(item)
    end

    it "assigns @items with pagination" do
      get :index
      items = Item.page(1).per(10)
      expect(assigns(:items).count).to eq(items.count)
    end

  end
end
