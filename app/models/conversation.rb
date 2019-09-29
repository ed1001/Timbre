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
    where(recipient_id: user.id).or(Conversation.where(sender_id: user.id))
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
end
