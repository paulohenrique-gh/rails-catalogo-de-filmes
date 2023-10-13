class AddNameToDirector < ActiveRecord::Migration[7.1]
  def change
    add_column :directors, :name, :string
    add_index :directors, :name, unique: true
  end
end
