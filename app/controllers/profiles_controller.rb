class ProfilesController < ApplicationController
  def index
    @avoids = current_user.avoids
    # @users = User.all_except(current_user, @avoids, current_user.latitude, current_user.longitude, current_user.range)
    @users = User.all_except(current_user, @avoids)
  end

  def settings
    @location = Geocoder.search([current_user.latitude, current_user.longitude])
  end

  def locate
    current_user.update(latitude: params['latitude'], longitude: params['longitude'])
  end

  def range
    current_user.update(range: params['range'].to_i)
  end

  def edit_bio
    @text = current_user.bio
    puts @text
    respond_to do |format|
      format.js
    end
  end

  def save_bio
    @text = params[:text]
    current_user.update(bio: @text)
    respond_to do |format|
      format.js
    end
  end

  def update_youtube
    current_user.update(youtube_vid_id: params[:youtube_id])
    respond_to do |format|
      format.js
    end
  end

  def update_soundcloud
    @valid = current_user.update(sc_url: params[:soundcloud_url])
    respond_to do |format|
      format.js
    end
  end
end
