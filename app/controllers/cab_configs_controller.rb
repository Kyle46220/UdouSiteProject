class CabConfigsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cab_config, only:[ :show, :destroy, :show, :edit, :update]

  before_action :set_user_profile_collection, only: [:new, :edit, :collection]

  def index
    @cab_configs = CabConfig.all #(where public = true)
    
  end

  # This is the controller that displays the cab_config index by collection. The 'show' links on collection index page call it. 
  def collection
    @collection = Collection.find(params[:collection_id])

    

    @cab_configs = CabConfig.where(collection_id: @collection.id)
    render 'index'
    


  end

  #This controller is for displaying saved designs of customers accessible from the profile#show. 

  def private_index
    if current_user.profile.user_type == "customer"
    @collection = current_user.profile.collections.first
    @cab_configs = CabConfig.where(collection_id: @collection.id)
    render 'collection_index'
    else 
      @cab_configs = CabConfig.all
      render 'index'
    end

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

  def customer_create
  end

  

  def edit
    
  end
 #This controller is has different results depending on whether your admin or customer. Updating as an admin will just update a cabinet, whereas updating as a customer will creat a new cabinet and a new collection, if you don't already have one which will then be displayed in the profile saved designs section. 
  def update
    @profile = current_user.profile

    if current_user.profile.user_type == 'customer'
      if current_user.profile.collections.first == nil
    @cab_config = CabConfig.new(cab_config_params)
    @cab_config.collection = current_user.profile.collections.new(name: current_user.profile.name, public_display: false, profile_id: current_user.profile.id)
      else
        @cab_config = CabConfig.new(cab_config_params)
        @cab_config.collection = current_user.profile.collections.first
        # where(name: current_user.profile.name)
      end
   
    else
      @cab_config.update(cab_config_params)
      
    end

    if @cab_config.save
      redirect_to collections_path
    end
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
