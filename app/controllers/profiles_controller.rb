class ProfilesController < ApplicationController
  def index
    @avoids = []
    current_user.avoids.each do |avoid|
      @avoids << avoid.opposed_user_id
    end
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
end
