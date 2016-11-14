class EstimatesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin, only: [:new, :edit, :update, :destroy]
  before_action :set_estimate, only: [:show, :edit, :update, :destroy]
  
  def index
    @estimates = Estimate.all
  end

  # GET /estimates/1
  # GET /estimates/1.json
  def show
    @users = @estimate.dwelling_users
    @realtor = User.where(id: @estimate.realtor_id)
  end

  # GET /estimates/new
  def new
    @estimate = Estimate.new
  end

  # GET /estimates/1/edit
  def edit
    unless current_user["id"] == @estimate["realtor_id"]
      redirect_to estimates_path
    end
  end

  def create
    @estimate = current_user.estimates.build(estimate_params)
    
    respond_to do |format|
      if @estimate.save
        format.html { redirect_to @estimate, notice: 'Estimate was successfully created.' }
        format.json { render :show, status: :created, location: @estimate }
      else
        format.html { render :new }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    unless current_user["id"] == @estimate["realtor_id"]
      redirect_to estimates_path
    else
    respond_to do |format|
      if @estimate.update(estimate_params)
        format.html { redirect_to @estimate, notice: 'Estimate was successfully updated.' }
        format.json { render :show, status: :ok, location: @estimate }
      else
        format.html { render :edit }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # DELETE /estimates/1
  # DELETE /estimates/1.json
  def destroy
    unless current_user["id"] == @estimate["realtor_id"]
      redirect_to estimates_path
    else
    @estimate.destroy
    respond_to do |format|
      format.html { redirect_to estimates_url, notice: 'Estimate was successfully destroyed.' }
      format.json { head :no_content }
    end
    end
  end
  
  def readed_user
     @micropost = Micropost.find(params[:id])
     @users = @micropost.read_users
  end
  
  def search
    if params[:a] || params[:b]
      @estimates = Estimate.estimate_search(params[:a], params[:b] )
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimate
      @estimate = Estimate.find(params[:id])
    end

    def estimate_params
      params.require(:estimate).permit(:name, :fee, :floortype, :comment, :place, :avatar, :vacants)
    end
end
