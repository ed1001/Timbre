class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :user_id
  belongs_to :conversation

  validates :body, presence: true, allow_blank: false

  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
