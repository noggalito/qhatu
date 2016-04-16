class MakeEmailTransientInUser < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :email, :string, default: "", null: true
    end
    add_index :users,
              [:provider, :uid],
              unique: true
  end

  def down
    remove_index :users, [:provider, :uid]
  end
end
