class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path,
                  notice: 'Success'
    else
      redirect_to new_item_path,
                  error: 'Something went wrong'
    end
  end

  private

  def items_params
    params.require(:item).permit :titulo, :imagen, :precio, :detalle
  end
end
