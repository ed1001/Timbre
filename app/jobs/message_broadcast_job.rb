class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    sender = message.sender
    recipient = message.conversation.opposed_user(sender)

    broadcast_to_sender(sender, message)
    broadcast_to_recipient(recipient, message)
  end

  private

  def broadcast_to_sender(user, message)
    ActionCable.server.broadcast(
      "conversations-#{user.id}",
      message: render_message(message, user),
      conversation_id: message.conversation_id,
      user_id: message.user_id,
      message_id: message.id,
      sender_name: message.sender.user_name.to_s,
      sender_photo: photo_check(message),
      sent_at: message.created_at.to_time.strftime("%k:%M")
    )
  end

  def broadcast_to_recipient(user, message)
    ActionCable.server.broadcast(
      "conversations-#{user.id}",
      message: render_message(message, user),
      conversation_id: message.conversation_id,
      user_id: message.user_id,
      message_id: message.id,
      sender_name: message.sender.user_name.to_s,
      sender_photo: photo_check(message),
      sent_at: message.created_at.to_time.strftime("%k:%M")
    )
  end

  def render_message(message, user)
    ApplicationController.render(
      partial: 'messages/message',
      locals: { message: message, user: user }
    )
  end

  def photo_check(message)
    message.sender.photos.any? ? message.sender.photos.first.photo.url : nil
  end
end
