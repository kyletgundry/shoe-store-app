class CartedShoesController < ApplicationController
  before_action :authenticate_user!

  def create
    carted_shoe = CartedShoe.new(
      quantity: params[:quantity],
      user_id: current_user.id,
      shoe_id: params[:shoe_id],
      status: "carted"
      )
    carted_shoe.save
    redirect_to "/carted_shoes"
  end

  def index
    @carted_shoes = CartedShoe.where(status: "carted", user_id: current_user.id)
    if @carted_shoes.length > 0
      render "index.html.erb"
    else
      redirect_to "/"
    end
  end  

  def destroy
    carted_shoe = CartedShoe.find_by(id: params[:id])
    carted_shoe.status = "removed"
    carted_shoe.save
    redirect_to "/carted_shoes"
  end
end
