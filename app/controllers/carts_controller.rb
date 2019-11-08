class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_profile, only: [:new]
  # def new
  #   @cart = current_user.profile.cart.new
  # end

  # def create
  #   @cart = current_user.profile.carts.create(cart_params)
  # end
  def show
    @cart = @current_cart
    
    
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: current_user.profile.name,
            description: "#{current_user.profile.name}'s cabinets",
            amount: @cart.sub_total * 100 , 
            currency: 'aud',
            quantity: 1
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                listing_id: @cart.id
            }
        },
        success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@cart.id}",
        cancel_url: "#{root_url}collections"
    )



    @session_id = session.id
   
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to collections_path
  end

  

 private
  def set_user_profile    
    @profile = current_user.profile
  end

  def cart_params
    params.require(:cart).permit(:result_of_transaction, :transaction_date, :profile_id, :created_at, :updated_at)
  
  end
end

