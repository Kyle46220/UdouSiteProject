class CabConfigsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cab_config, only:[ :show, :destroy, :show]

  before_action :set_user_profile_collection, only: [:new]
  def index
    @cab_configs = CabConfig.all #(where public = true)
    
  end

  def collection
    @cab_configs = CabConfig.where(collection)
  end

 


  

  def show
    

  end
  def new

      @cab_config = CabConfig.new

      
  end

  def create
 
    # @cab_config = current_user.profile.collections.cab_configs.new(cab_config_params)


    # if @cab_config.save
    #   redirect_to root_path
    # else
    #   render "new"
    # end
    id = params[:id]
   
    @cab_config = CabConfig.new(cab_config_params)
    # @cab_config.collection = current_user.profile.collections.find_by_id(id)

    if @cab_config.save
      redirect_to cab_configs_path
    else 
      render "new"
    
    end


  end

  

  def edit
  end

  def update
  end

  def destroy
    @cab_config.destroy
    redirect_to cab_configs_path
  end

  private

  def set_cab_config  
    
    @cab_config = CabConfig.find(params[:id])
  
  end

  def set_user_profile_collection
    id = params[:id]
    @collection = current_user.profile.collections.find_by_id(id)

  end

 def cab_config_params
  params.require(:cab_config).permit(:collection_id, :height, :width, :depth, :drawer_qty, :shelf_qty, :cupboard_qty, :style, :colour, :back_panel )

 end




end
