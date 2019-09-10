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
    # metadata is lost after upload so need to add to attributes here
    # also need to have this updated in Update below to display the photo correctly, the metadata would be fixed values even if we had them after upload
    # with one single update call it doesn't work, says 'photo is missing' so needed to do by attribute, *find out why*
    # @photo.update_attribute(:width, width)
    # @photo.update_attribute(:height, height)
    @photo.update(width: width, height: height)

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
