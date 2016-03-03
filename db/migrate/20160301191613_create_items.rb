class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :titulo
      t.string  :imagen
      t.float   :precio
      t.text    :detalle

      t.timestamps null: false
    end
  end
end
