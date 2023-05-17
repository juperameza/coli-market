class FavoritesController < ApplicationController
  def change_favorite
    # Find the favorite based on the post ID and current user ID
    @favorite = Favorite.where(post_id: params[:id]).where(user_id: current_user.id)

    if @favorite.empty?
      # If the favorite does not exist, create a new favorite with the post ID and current user ID
      @favorite = Favorite.create(post_id: params[:id], user_id: current_user.id)
      redirect_back fallback_location: root_path
    else
      # If the favorite exists, destroy all matching favorites
      @favorite.destroy_all
      redirect_back fallback_location: root_path
    end
  end
end
