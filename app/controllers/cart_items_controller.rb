class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart
  def index
    @cart_items = CartItem.all
  end

  def create

    
    @cart = Cart.new(params)
    # if current_user.profile.carts == nil
    #   current_user.profile.carts.create(cart_item_params)
    @cart_item = CartItem.create(cart_item_params)

    # end
  end

  def update
    @cart_item.update(cart_item_params)
  end

  def destroy
    @cart_item.delete
  end

  private

  def set_cart
    @cart = current_user.profile.carts.find(params[:id])
    
  end

  def cart_item_params
  params.require(:cart_item).permit(:cab_config_id, :cart_id)
  end

end
