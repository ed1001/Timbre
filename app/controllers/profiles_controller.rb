class ProfilesController < ApplicationController
  def index
    @avoids = current_user.avoids
    @users = User.all_except(current_user, @avoids, current_user.latitude, current_user.longitude, current_user.range)
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
end
