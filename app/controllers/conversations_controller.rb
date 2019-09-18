class ConversationsController < ApplicationController

  def index
    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.where(recipient_id: current_user.id).or(Conversation.where(sender_id: current_user.id))
  end

  def create
    @conversation = Conversation.get(current_user.id, params[:user_id])
    @is_new_conversation = @conversation.id.nil?
    @conversation.save!
    message = Message.new(message_params)
    message.update(conversation: @conversation, sender: current_user)

    respond_to do |format|
      format.js
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order(id: :asc)
    @messages.where.not(sender: current_user).where(read: false).update_all(read: true)

    respond_to do |format|
      format.js
    end
  end

  private

  def message_params
    params.require(:conversation).permit(:body)
  end
end
