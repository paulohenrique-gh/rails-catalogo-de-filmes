class ChangeNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :genres, :name, false
    change_column_null :directors, :name, false
    change_column_null :directors, :nationality, false
    change_column_null :directors, :birth_date, false
    change_column_null :movies, :title, false
    change_column_null :movies, :release_year, false
    change_column_null :movies, :synopsis, false
    change_column_null :movies, :origin, false
    change_column_null :movies, :length, false
    change_column_null :movies, :status, false
  end
end
