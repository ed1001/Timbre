class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update_message]

  def create
    @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)
    respond_to do |format|
      format.js
    end
  end

  def update_message
    Message.find(params[:id]).update(read: true)
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :body)
  end
end
