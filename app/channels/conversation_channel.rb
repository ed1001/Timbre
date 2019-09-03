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

    Message.create(message_params)
  end

  # simple enough to not use a seperate job class
  def typing_status(status)
    ActionCable.server.broadcast(
      "conversations-#{status['user_id']}",
      status: status['status'],
      user_id: current_user.id
    )
  end
end
