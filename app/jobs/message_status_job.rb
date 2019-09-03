class MessageStatusJob < ApplicationJob
  queue_as :default

  def perform(user_id, status)
    broadcast_to_recipient(user_id, status)
  end

  private

  def broadcast_to_recipient(user_id, status)
    ActionCable.server.broadcast(
      "conversations-#{user_id}",
      status: status
    )
  end
end
