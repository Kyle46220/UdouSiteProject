class CabConfigsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cab_config, only:[ :show]

  before_action :set_user_profile_collection
  def index
    @cab_configs = CabConfig.all #(where public = true)
    
  end

  

  def show

  end

  def create

    @cab_config = current_user.profile.collections.cab_config.new(listing_params)
    if @listing.save
      redirect_to listings_path
    else
      render "new"
    end

  end

  def new

    @cab_config = CabConfig.new

    
  end

  def edit
  end

  def update
  end

  private

  def set_cab_config   
    @cab_config = CabConfig.find(params[:id])
  
  end

  def set_user_profile_collection
    id = params[:id]
    @collection = current_user.profile.collections.find_by_id(id)

  end




end
