class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show]
  # before_action :set_profile_user

  def new
    @profile = Profile.new
  end

  def create
    
  
    
    @profile = Profile.new(profile_params)
   
    @profile.user = current_user
 
    if @profile.save
      redirect_to collections_path
    else
      render "new"
    end

  
  end

  def show
  end



  private

  def profile_params
    params.require(:profile).permit(:name,:user_type, :email_opt_in)

  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  

  def set_user_profile
    id = params[:id]
    @profile = current_user.profile.find_by_id(id) 

  end



end
