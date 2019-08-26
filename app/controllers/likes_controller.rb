class LikesController < ApplicationController
  def update
    # get details to render next user
    @next = params[:next]
    # add to avoid list
    current_user.avoids.build(opposed_user_id: params[:id]).save!
    @liked = params[:liked] == 'true'

    if @liked
      # you liked them, check if opposed user has come across you
      find_like = User.find(params[:id]).likes.find { |like| like.opposed_user_id == current_user.id }
      if find_like
        # find_like.liked returns bool, assign to @match
        @match = find_like.liked
        @opposed_user = User.find(params[:id])
        current_user.matches.build(opposed_user_id: params[:id]).save!
      else
        # has not come across you yet, add this user to your likes array
        current_user.likes.build(opposed_user_id: params[:id], liked: true).save!
      end
    else
      # you didn't like them, add to likes array, liked: false
      current_user.likes.build(opposed_user_id: params[:id], liked: false).save!
    end

    respond_to do |format|
      format.js
    end
  end
end
