class RemoveFavoriteGenreIdFromDirectors < ActiveRecord::Migration[7.1]
  def change
    remove_column :directors, :favorite_genre_id, :integer
  end
end
