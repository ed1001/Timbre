class LikesController < ApplicationController
  def update
    # get details to render next user
    @next = params[:next]

    # add to avoid list
    current_user.avoids.build(like_params).save!

    @like_info = Like.process(params[:liked] == 'true', params[:id], current_user)

    respond_to do |format|
      format.js
    end
  end

  private

  def like_params
    params.permit(:id)
  end
end
