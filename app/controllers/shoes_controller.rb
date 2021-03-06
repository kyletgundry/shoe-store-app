class ShoesController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    if params[:search]
      @shoes = Shoe.where("brand ILIKE ?", "%" + params[:search] + "%")
    elsif params[:discounted] == "true"
      @shoes = Shoe.where("price < ?", 50)
    elsif params[:category]
      category = Category.find_by(name: params[:category])
      @shoes = category.shoes
    else
      sort_attribute = params[:sort_by] || "brand"
      sort_attribute_order = params[:sort_order] || "asc"
      @shoes = Shoe.all.order(sort_attribute => sort_attribute_order)
    end
    render "index.html.erb"
  end

  def new
    @shoe = Shoe.new
    render "new.html.erb"
  end

  def create
    @shoe = Shoe.new(
      brand: params[:brand],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
      )
    if @shoe.save

      image = Image.new(
        url: params[:image],
        shoe_id: @shoe.id
        )
      image.save
      flash[:success] = "You successfully added a shoe!"
      redirect_to "/shoes/#{@shoe.id}"
    else
      render "new.html.erb"
    end
  end

  def random
    @shoe = Shoe.all.sample
    render "show.html.erb"
  end
  
  def show
    if params[:id] == "ramdom"
      @shoe = Shoe.all.sample
    else
      @shoe = Shoe.find_by(id: params[:id])
      # @categories = @shoe.categories - if you don't want this to be added to the html
    end
    render "show.html.erb"
  end

#  def search
#    @products = Product.where("name LIKE ?", "%" + params[:search] + "%")
#    render "index.html.erb"
#  end
  def edit
    @shoe = Shoe.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @shoe = Shoe.find_by(id: params[:id])
    @shoe.brand = params[:brand]
    @shoe.price = params[:price]
    @shoe.description = params[:description]
    @shoe.supplier_id = params[:supplier_id]

    @shoe.update(
      brand: params[:brand],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )


    if @shoe.save
      flash[:success] = "You successfully updated a shoe!"
      redirect_to "/shoes/#{@shoe.id}"
    else
      render "edit.html.erb"
    end
  end

  def destroy
    @shoe = Shoe.find_by(id: params[:id])
    @shoe.destroy
    flash[:danger] = "You successfully deleted the shoe!"
    redirect_to "/shoes"
  end
end
