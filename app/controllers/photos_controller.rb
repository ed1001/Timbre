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

    width = @photo.photo.metadata['width']
    height = @photo.photo.metadata['height']
    @photo.update_attribute(:width, width)
    @photo.update_attribute(:height, height)

    @photo_id = @photo.id
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
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
