class ShoesController < ApplicationController

  def index
    @shoes = Shoe.all.order(:brand)
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    shoe = Shoe.new(
      brand: params[:brand],
      price: params[:price],
      image: params[:image],
      description: params[:description]
      )
    shoe.save
    render "create.html.erb"
  end
  def show
    @shoe = Shoe.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @shoe = Shoe.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @shoe = Shoe.find_by(id: params[:id])
    @shoe.brand = params[:brand]
    @shoe.price = params[:price]
    @shoe.image = params[:image]
    @shoe.description = params[:description]
    @shoe.save
    render "update.html.erb"
  end

  def destroy
    @shoe = Shoe.find_by(id: params[:id])
    @shoe.destroy
    render "delete.html.erb"
  end


end
