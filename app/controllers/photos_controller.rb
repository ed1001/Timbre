require 'pry'

class PhotosController < ApplicationController
  def new
    @photo = Photo.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    @photo.save!

    @photo_id = @photo.id

    width = @photo.photo.metadata['width']
    height = @photo.photo.metadata['height']

    @scale = 500.0 / [width, height].max
    @scaled_width = (width * @scale).to_i
    @scaled_height = (height * @scale).to_i

    respond_to do |format|
      format.js
    end
  end

  def update
    @photo = Photo.find(params[:photo_id].to_i)
    @photo.width = params[:width]
    @photo.height = params[:height]
    @photo.x = params[:left]
    @photo.y = params[:top]

    @photo.save!

    respond_to do |format|
      format.js
    end

    # send in ID of the photo to fetch it then set coords attributes with which you can then render the images in veiws like so:
    # cl_image_tag("brown_sheep.jpg", :transformation=>[
  # {:x=>355, :y=>410, :width=>300, :height=>200, :crop=>"crop"},
  # {:width=>150, :height=>100, :crop=>"scale"}
  # ])

  # https://cloudinary.com/documentation/image_transformations
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
