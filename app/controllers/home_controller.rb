class HomeController < ApplicationController
  def index
      @estimates = Estimate.search(params)
    #  if  !(params[:a].blank?) && !(params[:b].blank?) && params[:c].blank?
    #      @estimates = Estimate.estimate_search(params[:a], params[:b] )
    #  end
    #  if !(params[:a].blank?) && params[:b].blank? && params[:c].blank?
    #      @estimates = Estimate.where(place: params[:a])
    #  end
    #  if !(params[:b].blank?) && params[:a].blank? && params[:c].blank?
    #      @estimates = Estimate.estimate_fee(params[:b])
    #  end
    #  if !(params[:c].blank?) && params[:b].blank? && params[:a].blank?
    #      @user = User.where(job: params[:c])
    #      @dwelling = Dwelling.where(person_id: @user.ids)
    #      @estimates = Estimate.where(id: @dwelling.ids)
    #  end
    #  if !(params[:c].blank?) && !(params[:b].blank?) && !(params[:a].blank?)
    #      @user = User.where(job: params[:c])
    #      @dwelling = Dwelling.where(person_id: @user.ids)
    #      @a1 = Estimate.where(id: @dwelling.ids)
    #      @estimates  = Estimate.estimate_search(params[:a], params[:b] ).estimate_id(@a1.ids)
    #  end
    #  if !(params[:c].blank?) && !(params[:b].blank?) && params[:a].blank?
    #      @user = User.where(job: params[:c])
    #      @dwelling = Dwelling.where(person_id: @user.ids)
    #      @a1 = Estimate.where(id: @dwelling.ids)
    #      @estimates = Estimate.estimate_fee(params[:b] ).estimate_id(@a1.ids)
    #  end
    #  if !(params[:c].blank?) && params[:b].blank? && !(params[:a].blank?)
    #      @user = User.where(job: params[:c])
    #      @dwelling = Dwelling.where(person_id: @user.ids)
    #      @a1 = Estimate.where(id: @dwelling.ids)
    #      @estimates = Estimate.where(id: @a1.ids, place: params[:a])
    #  end
  end
end
