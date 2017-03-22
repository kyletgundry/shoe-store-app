class ImagesController < ApplicationController
  def index
    sort_attribute = params[:sort_by] || "url"
    sort_attribute_order = params[:sort_order] || "asc"
    @images = Image.all.order(sort_attribute => sort_attribute_order)
    render "index.html.erb"
  end
  def new
    render "new.html.erb"
  end

  def create
    p params[:url]

    image = Image.new(
      url: params[:url],
      shoe_id: params[:shoe_id]
      )
    image.save
    flash[:success] = "You successfully added an image!"
    redirect_to "/images"
  end

  def show
    @image = Image.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @image = Image.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @image = Image.find_by(id: params[:id])
    @image.url = params[:url]
    @image.shoe_id = params[:shoe_id]
    @image.save
    flash[:success] = "You successfully updated the image!"
    redirect_to "/images"
  end
  def destroy
    @image = Image.find_by(id: params[:id])
    @image.destroy
    flash[:danger] = "You successfully deleted the image!"
    redirect_to "/images"
  end
end
