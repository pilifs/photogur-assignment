class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  # Why is this necessary? --Perhaps just to initialize form, does not save... Would it work with required params? How to do req'd params?
  def new
    @photo = Photo.new
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to("/photos/#{@photo.id}")
    else
      render :edit
    end
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_url
    else
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_url
  end

  private
  def photo_params
    params.require(:photo).permit(:author, :title, :url)
  end
end
