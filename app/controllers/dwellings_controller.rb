class DwellingsController < ApplicationController
    def create
        @person = Person.find_by(email: params[:q])
        @estimate = Estimate.find(params[:id])
        Dwelling.find_or_create_by(estimate_id: @estimate.id, person_id: @person.id)
        redirect_to estimates_path
    end
    
    def show
        @dwelling = Dwelling.find(params[:id])
    end
    
    def edit
        @dwelling = Dwelling.find(params[:id])
        unless current_user.id == @dwelling.person_id
          redirect_to root_url
        end
        @dwelling = Dwelling.find(params[:id])
    end
    
    def update
    @dwelling = Dwelling.find(params[:id])
    unless current_user["id"] == @dwelling.person_id
          redirect_to root_url
    end
        if @dwelling.update(dwelling_params)
          redirect_to dwelling_path(@dwelling)
        else
          redirect_to dwelling_path(@dwelling)
        end
    end
    
    private
    
    def dwelling_params
      params.require(:dwelling).permit(:comment, :start_time, :end_time)
    end
end
