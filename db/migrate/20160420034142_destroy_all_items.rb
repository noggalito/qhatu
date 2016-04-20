class DestroyAllItems < ActiveRecord::Migration
  def change
    Item.destroy_all
  end
end
