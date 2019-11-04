class CollectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection, only:[ :show, :destroy]
  before_action :set_user_profile_collection, only: [:edit, :update]

  def index
    @collections = Collection.all
  end

  def show
  end
  def public
    @collections = Collection.where(public: true)

  end

  def private
    @collections = Collection.where(public: false)

  end

  def create
    # byebug
    @collection = current_user.profile.collections.new(collection_params)
    
    
    if @collection.save
      redirect_to collections_path
    else
      render "new"
    end
  end

  def new
    @collection = Collection.new
  end

  def edit
  end

  def update
  end

  def destroy
    @collection.destroy
    redirect_to collections_path
  end
   private

   def set_collection
    @collection = Collection.find(params[:id])
  end

 

  def set_user_profile_collection
    id = params[:id]
    @collection = current_user.profile.collections.find_by_id(id) 

  end

  def collection_params
    params.require(:collection).permit(:name,:public)

  end

end
