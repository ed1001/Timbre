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
    width = @photo.photo.metadata['width']
    height = @photo.photo.metadata['height']

    @max_dimension = width > height ? 'width' : 'height'

    respond_to do |format|
      format.js
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
