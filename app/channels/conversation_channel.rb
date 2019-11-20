class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations-#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end

  def speak(data)
    message_params = data['message'].each_with_object({}) do |el, hash|
      hash[el.values.first] = el.values.last
    end

    @message = Message.create!(message_params)
    convo = @message.conversation
    convo.mark_as_read(convo.opposed_user(current_user), false)
  end

  # simple enough to not use a seperate job class
  def typing_status(data)
    ActionCable.server.broadcast(
      "conversations-#{data['user_id']}",
      status: data['status'],
      user_id: current_user.id
    )
  end

  def new_match(data)
    convo = Conversation.find(data['convo_id'].to_i)

    ActionCable.server.broadcast(
      "conversations-#{convo.sender_id}",
      new_match: true
    )
    ActionCable.server.broadcast(
      "conversations-#{convo.recipient_id}",
      new_match: true
    )
  end
end
