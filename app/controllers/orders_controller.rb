class OrdersController < ApplicationController

  def index
    @orders = Order.all.order(:created_at)
    render "index.html.erb"
  end

  def create
    shoe = Shoe.find_by(id: params[:shoe_id])
    subtotal = params[:quantity].to_i * shoe.price
    tax = subtotal * 0.09
    total = subtotal + tax
    order = Order.new(
      quantity: params[:quantity],
      user_id: current_user.id,
      shoe_id: params[:shoe_id],
      subtotal: subtotal,
      tax: tax,
      total: total
      )
  
    order.save
    redirect_to "/orders/#{order.id}"
    # render "show.html.erb" if you use @ in the order for create method
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end

end
