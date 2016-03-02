class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
      flash[:notice] = 'Success'
    else
      redirect_to new_item_path
      flash[:notice] = 'Failed'
    end
  end

  private

  def items_params
    params.require(:item).permit :titulo, :imagen, :precio, :detalle
  end

end
