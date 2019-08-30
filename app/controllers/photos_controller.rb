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

  def update
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
