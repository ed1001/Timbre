class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update_message]

  def create
    # only called from match modal
    @message = Message.create!(message_params)
    convo = @message.conversation
    convo.mark_as_read(convo.opposed_user(current_user), false)

    # if params[:from_modal].nil?
      respond_to do |format|
        format.js
      end
    # end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :body, :conversation_id)
  end
end
