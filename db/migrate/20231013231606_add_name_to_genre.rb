class AddNameToGenre < ActiveRecord::Migration[7.1]
  def change
    add_column :genres, :name, :string
    add_index :genres, :name, unique: true
  end
end
