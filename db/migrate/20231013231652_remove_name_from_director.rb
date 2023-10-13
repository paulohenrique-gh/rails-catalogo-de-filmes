class RemoveNameFromDirector < ActiveRecord::Migration[7.1]
  def change
    remove_column :directors, :name, :string
  end
end
