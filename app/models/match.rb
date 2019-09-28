class Match < ApplicationRecord
  belongs_to :user
  belongs_to :opposed_user, foreign_key: :opposed_user_id, class_name: 'User'

  validates :user_id, uniqueness: { scope: :opposed_user_id }

  def self.fetch_matches(user)
    user.matches.map do |match|
      match.user == user ? match.opposed_user : match.user
    end
  end
end
