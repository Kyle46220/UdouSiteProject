class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :current_cart

  private

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id] == nil
      @current_cart = Cart.new
      session[:cart_id] = @current_cart.id
    end
  end
  # def cart_params
  #   params.require(:cart).permit(:result_of_transaction, :transaction_date, :profile_id, :created_at, :updated_at)
  
  # end

  
  
  protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
  end

  def after_sign_out_path_for(resource)
    # return the path based on resource
    # redirect_to root_path
    root_path
  end
  
  
 
end
