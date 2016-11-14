class FavoritesController < ApplicationController
  def create
     @estimate = Estimate.find(params[:id])
     Favorite.find_or_create_by(estimate_id: @estimate.id, person_id: current_user.id)
     redirect_to estimates_path
  end
  
  def destroy
     @estimate = Estimate.find(params[:id])
     @favorite = Favorite.find_by(estimate_id: @estimate.id, person_id: current_user.id)
     @favorite.destroy
     redirect_to estimates_path
  end
  
end
