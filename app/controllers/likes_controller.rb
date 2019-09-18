class LikesController < ApplicationController
  def update
    # get details to render next user
    @next = params[:next]

    # add to avoid list
    current_user.avoids.build(avoid_params).save!

    @like_info = Like.process(like_params, current_user)

    respond_to do |format|
      format.js
    end
  end

  private

  def avoid_params
    params.permit(:opposed_user_id)
  end

  def like_params
    params.permit(:liked, :opposed_user_id)
  end
end
