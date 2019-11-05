class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_user_profile, only: [:show, :edit, :update]

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
    # @profile = current_user.profile
    
  end

  def edit
    
  end

  def update
    # @profile = current_user.profile
    @profile.update(profile_params)
    redirect_to collections_path
  end



  private

  def profile_params
    params.require(:profile).permit(:name,:user_type, :email_opt_in)

  end

  

  

  def set_user_profile
    
    @profile = current_user.profile 

  end



end
