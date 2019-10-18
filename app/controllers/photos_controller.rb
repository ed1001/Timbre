class PhotosController < ApplicationController
  # max width/height for crop photo disply
  CROP_DIMENSION = 500.0

  def new
    @photo = Photo.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.update(position: current_user.photos.count, user: current_user)

    width = @photo.photo.metadata['width']
    height = @photo.photo.metadata['height']
    @photo.update(width: width, height: height)

    @scale = CROP_DIMENSION / [width, height].max
    @scaled_width = (width * @scale).to_i
    @scaled_height = (height * @scale).to_i

    respond_to do |format|
      format.js
    end
  end

  def update
    @photo = Photo.find(params[:photo_id].to_i)
    @photo.update(update_params)

    respond_to do |format|
      format.js
    end
  end

  def update_position
    new_pos = params['new'].to_i
    old_pos = params['old'].to_i

    photos = photo_range([new_pos, old_pos]).to_a
    if new_pos < old_pos
      shuffle_up(photos, new_pos)
    elsif new_pos > old_pos
      shuffle_down(photos, new_pos)
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end

  def update_params
    params.permit(:width, :height, :x, :y)
  end

  def photo_range(pos)
    Photo.where(user: current_user, position: pos.min..pos.max).order(position: :asc)
  end

  def shuffle_up(photos, new_pos)
    Photo.transaction do
      photos.pop.update_attribute('position', new_pos)
      photos.each { |photo| photo.increment!(:position) }
    end
  end

  def shuffle_down(photos, new_pos)
    Photo.transaction do
      photos.shift.update_attribute('position', new_pos)
      photos.each { |photo| photo.decrement!(:position) }
    end
  end
end
