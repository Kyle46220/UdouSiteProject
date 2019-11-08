class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    #  session = Stripe::Checkout::Session.create(
    #     payment_method_types: ['card'],
    #     customer_email: current_user.email,
    #     line_items: [{
    #         name: @order.name,
    #         description: "#{@order.name} cabinets",
    #         amount: @order.cart.subtotal,
    #         currency: 'aud',
    #         quantity: 1,
    #     }],
    #     payment_intent_data: {
    #         metadata: {
    #             user_id: current_user.id,
    #             listing_id: @cab_config.id
    #         }
    #     },
    #     success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
    #     cancel_url: "#{root_url}listings"
    # )



    # @session_id = session.id
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @current_cart.cart_items.each do |item|
      @order.cart_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to order_path
  end
  
  private
    def order_params
      params.require(:order).permit(:name, :email, :address, :pay_method)
    end

end

 # session = Stripe::Checkout::Session.create(
    #     payment_method_types: ['card'],
    #     customer_email: current_user.email,
    #     line_items: [{
    #         name: @order.name,
    #         description: @cab_config.collection.name,
    #         amount: @cab_config.price * 100,
    #         currency: 'aud',
    #         quantity: 1,
    #     }],
    #     payment_intent_data: {
    #         metadata: {
    #             user_id: current_user.id,
    #             listing_id: @cab_config.id
    #         }
    #     },
    #     success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
    #     cancel_url: "#{root_url}listings"
    # )



    # @session_id = session.id

