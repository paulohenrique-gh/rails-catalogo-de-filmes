class RenameDurationToLengthInMovie < ActiveRecord::Migration[7.1]
  def change
    rename_column :movies, :duration, :length
  end
end
