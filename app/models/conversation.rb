class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

  validates :sender_id, uniqueness: { scope: :recipient_id }

  scope :between, -> (sender, recipient) do
    where(sender: sender, recipient: recipient).or(
      where(sender: recipient, recipient: sender)
    )
  end

  scope :fetch_conversations, -> (user) do
    where(recipient_id: user.id)
      .or(where(sender_id: user.id))
      .select { |convo| convo.messages.any? }
      .sort_by { |convo| convo.messages.last.created_at }
      .reverse
  end

  def self.fetch_new_matches(user)
    user.conversations.reject { |convo| convo.messages.any? }
        .map { |convo| convo.sender == user ? {user: convo.recipient, new: convo.new_sender} : {user: convo.sender, new: convo.new_recipient} }
  end

  def self.check_conversation(sender, recipient)
    Conversation.between(sender, recipient).first_or_create do |convo|
      convo.sender = sender
      convo.recipient = recipient
    end
  end

  def opposed_user(user)
    user == recipient ? sender : recipient
  end

  def set_new(user)
    if sender == user
      update!(new_sender: false)
    else
      update!(new_recipient: false)
    end
    self
  end
end
