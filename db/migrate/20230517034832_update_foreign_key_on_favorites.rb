class UpdateForeignKeyOnFavorites < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :favorites, :posts
    add_foreign_key :favorites, :posts, on_delete: :cascade
  end
end
