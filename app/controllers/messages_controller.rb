class MessagesController < ApplicationController
  def create
    # only called from match modal
    @message = Message.create!(message_params)
    convo = @message.conversation
    convo.mark_as_read(convo.opposed_user(current_user), false)

    respond_to do |format|
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :body, :conversation_id)
  end
end
