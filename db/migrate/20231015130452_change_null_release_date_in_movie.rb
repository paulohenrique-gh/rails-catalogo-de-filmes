class ChangeNullReleaseDateInMovie < ActiveRecord::Migration[7.1]
  def change
    change_column_null :movies, :release_date, false
  end
end
