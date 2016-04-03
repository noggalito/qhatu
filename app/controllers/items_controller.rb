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

class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path,
                  notice: I18n.t("items.created")
    else
      redirect_to new_item_path,
                  error: I18n.t("notice.error")
    end
  end

  private

  def items_params
    params.require(:item).permit :titulo, :imagen, :precio, :detalle
  end
end
