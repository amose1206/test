class ChargesController < ApplicationController
def new
 # @product = Proudct.find(params[:id])
end

def create
  # Amount in cents
  #@product = Product.find(params[:id])
  @product = Product.find_by_id(session[:productid])
  @amount = (Integer(@product.price) * 100)
  
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
    :metadata => {
    :tax_rate => 20,
    :sku => 'prod_99999', # use the same product code in Quaderno 
    :ip_address => request.ip, 
  }
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
end
