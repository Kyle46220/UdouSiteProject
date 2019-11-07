class UploadsController < ApplicationController
  
  def create
    @upload = Upload.new(upload_params)
    # @cab_config.collection = current_user.profile.collections.find_by_id(id)

    if @upload.save
      redirect_to collections_path
    else 
      render "new"
    end
  end

  def new
    @upload = Upload.new
  end

  def show
  end

  def index
  end

  private
  def upload_params
    params.require(:upload).permit(:cab_config_id, :image_upload)
  end

end
