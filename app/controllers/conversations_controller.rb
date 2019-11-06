class ConversationsController < ApplicationController
  def index
    @new_matches = Match.fetch_new_matches(current_user)
    @conversations = Conversation.fetch_conversations(current_user)
  end

  def create
    @conversation = Conversation.check_conversation(current_user, User.find(params[:user_id]))
    message = Message.new(message_params)
    message.update(conversation: @conversation, sender: current_user)

    respond_to do |format|
      format.js
    end
  end

  def start
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
