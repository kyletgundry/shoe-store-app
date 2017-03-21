class SuppliersController < ApplicationController

  def index
    sort_attribute = params[:sort_by] || "name"
    sort_attribute_order = params[:sort_order] || "asc"
    @suppliers = Supplier.all.order(sort_attribute => sort_attribute_order)
    render "index.html.erb"
  end
  def new
    render "new.html.erb"
  end

  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone: params[:phone],
      )
    supplier.save
    flash[:success] = "You successfully added a shoe!"
    redirect_to "/suppliers"
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @supplier = Supplier.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.brand = params[:name]
    @supplier.price = params[:email]
    @supplier.image = params[:phone]
    @supplier.save
    flash[:success] = "You successfully updated a shoe!"
    redirect_to "/suppliers"
  end
  def destroy
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.destroy
    flash[:danger] = "You successfully deleted the shoe!"
    redirect_to "/suppliers"
  end

end
