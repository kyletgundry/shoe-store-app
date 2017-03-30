class OrdersController < ApplicationController

  def index
    @orders = Order.all.order(:created_at)
    render "index.html.erb"
  end

  def create
    @carted_shoes = current_user.carted_shoes.where(status: "carted")
    # subtotal = 0
    # carted_shoes.each do |carted_shoe|
    #   subtotal += carted_shoe.quantity * carted_shoe.shoe.price
    # end
    subtotal = @carted_shoes.inject(0) {|sum, carted_shoe| sum + (carted_shoe.quantity * carted_shoe.shoe.price)}
    tax = subtotal * 0.09
    total = subtotal + tax
    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
      )
  
    @order.save
    # @carted_shoes.each do |carted_shoe|
    #   carted_shoe.order_id = @order.id
    #   carted_shoe.status = "purchased"
    #   carted_shoe.save
    @carted_shoes.update_all(status: "purchased", order_id: @order.id)
    redirect_to "/orders/#{@order.id}"
    # render "show.html.erb" if you use @ in the order for create method
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end
end


