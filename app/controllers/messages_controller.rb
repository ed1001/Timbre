class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update_message]

  def create
    @message = Message.create!(message_params)

    if params[:from_modal].nil?
      respond_to do |format|
        format.js
      end
    end
  end

  def update_message
    Message.find(params[:id]).update(read: true)
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :body, :conversation_id)
  end
end
