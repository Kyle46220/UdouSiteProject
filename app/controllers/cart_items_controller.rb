class CartItemsController < ApplicationController
  before_action :authenticate_user!
  # before_action :current_cart
  # def index
  #   @cart_items = CartItem.all
  # end

  # def create

    
  #   @cart = Cart.new(params)
  #   # if current_user.profile.carts == nil
  #   #   current_user.profile.carts.create(cart_item_params)
  #   @cart_item = CartItem.create(cart_item_params)

  #   # end
  # end
  def create
    # Find associated product and current cart
    chosen_cabinet = CabConfig.find(params[:cab_config_id])
    current_cart = @current_cart
  
    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.cab_configs.include?(chosen_cabinet)
      # Find the line_item with the chosen_product
      @cart_item = current_cart.cart_items.find_by(cab_config_id: chosen_cabinet)
      # Iterate the line_item's quantity by one
      @cart_item.quantity += 1
    else
      @cart_item = CartItem.new
     
      @cart_item.cart = current_cart
      @cart_item.cab_config = chosen_cabinet
    end
    

    # Save and redirect to cart show path
    @cart_item.save
    redirect_to cart_path(current_cart)
  end
  
  
  

  # def update
  #   @cart_item.update(cart_item_params)
  # end

  def up_qty
    
      @cart_item = CartItem.find(params[:id])
      @cart_item.quantity += 1
      @cart_item.save
      redirect_to cart_path(@current_cart)
    
  end

  def down_qty
    
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(@current_cart)
    
  end

  def delete
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(@current_cart)
    
  end

  private

  # def set_cart
  #   @cart = current_user.profile.carts.find(params[:id])
    
  # end

  def cart_item_params
    params.require(:cart_item).permit(:quantity,:cab_config_id, :cart_id, :order_id)
  end
  
  
  # def current_cart
  #   if session[:cart_id]
  #     cart = Cart.find_by(:id => session[:cart_id])
  #     if cart.present?
  #       @current_cart = cart
  #     else
  #       session[:cart_id] = nil
  #     end
  #   end

  #   if session[:cart_id] == nil
  #     @current_cart = Cart.create
  #     session[:cart_id] = @current_cart.id
  #   end
  # end

end
