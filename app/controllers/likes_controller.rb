class LikesController < ApplicationController
  def update
    # get next details to render next user
    @next = params[:next]
    # add to avoid list
    current_user.avoids.build(opposed_user_id: params[:id]).save!
    @match = false
    @liked = params[:liked] == 'true'

    if @liked
      find_like = User.find(params[:id]).likes.find { |like| like.opposed_user_id == current_user.id }
      if find_like
        if find_like.liked
          # liked you too
          @match = true
          respond_to do |format|
            format.js
          end
        else
          # did not like you back
          respond_to do |format|
            format.js
          end
        end
      else
        # has not come across you yet, add this user to your likes array
        current_user.likes.build(opposed_user_id: params[:id], liked: true).save!
        respond_to do |format|
          format.js
        end
      end
    else
      current_user.likes.build(opposed_user_id: params[:id], liked: false).save!
      respond_to do |format|
        format.js
      end
    end
  end
end
