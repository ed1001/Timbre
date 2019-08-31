class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :body, presence: true, allow_blank: false

  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
