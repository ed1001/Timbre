class Like < ApplicationRecord
  belongs_to :user

  class << self
    def process(liked, id, current_user)
      like_info = {}
      if liked
        # you liked them, check if opposed user has come across you
        find_like = Like.find_by(user_id: id, opposed_user_id: current_user.id)
        sort_like(find_like, id, current_user, like_info)
      else
        # you didn't like them, add to likes array, liked: false
        current_user.likes.build(opposed_user_id: id, liked: false).save!
      end
      like_info
    end

    def sort_like(find_like, id, current_user, like_info)
      if find_like
        # find_like.liked returns bool, assign to match
        like_info[:match] = find_like.liked
        like_info[:opposed_user] = User.find(id)
        current_user.matches.build(opposed_user_id: id).save!
      else
        # has not come across you yet, add this user to your likes array
        current_user.likes.build(opposed_user_id: id, liked: true).save!
      end
    end
  end
end
