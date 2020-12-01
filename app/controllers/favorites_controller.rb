class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(item_id: params[:item_id])
    if favorite.save
      redirect_to items_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    if favorite.destroy
      redirect_to items_path
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
