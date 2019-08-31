class LikesController < ApplicationController
  def update
    # get details to render next user
    @next = params[:next]

    # add to avoid list
    current_user.avoids.build(opposed_user_id: params[:id]).save!

    @like_info = Like.process(params[:liked] == 'true', params[:id], current_user)

    respond_to do |format|
      format.js
    end
  end
end
