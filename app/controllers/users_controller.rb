class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @dwellings = Dwelling.where(person_id: @user.id)
    end
    
end
