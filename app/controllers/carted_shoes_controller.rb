class CartedShoesController < ApplicationController
  def create
    @shoe = Shoe.find_by(id: params[:id])
    @carted_shoe = CartedShoe.new(
      quantity: params[:quantity],
      user_id: current_user.id,
      shoe_id: params[:shoe_id],
      status: "carted"
      )
    @carted_shoe.save
    redirect_to "/cart"
  end

  def index
    @carted_shoes = CartedShoe.where(user_id: current_user.id)
    render "index.html.erb"
  end  

end
