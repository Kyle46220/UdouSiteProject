class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_profile, only: [:new]
  # def new
  #   @cart = current_user.profile.cart.new
  # end

  def create
    @cart = current_user.profile.carts.create(cart_params)
  end

  def edit
  end

  def update
  end

  def delete
  end

  def show
  end
 private
  def set_user_profile    
    @profile = current_user.profile
  end

  def cart_params
    params.require(:cart).permit(:result_of_transaction, :transaction_date, :profile_id, :created_at, :updated_at)
  
   end
end
