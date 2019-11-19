class ConversationsController < ApplicationController
  def index
    @new_matches = Conversation.fetch_new_matches(current_user)
    @conversations = Conversation.fetch_conversations(current_user)
  end

  def create
    @conversation = Conversation.check_conversation(current_user, User.find(params[:user_id]))
  end

  def start
    @conversation = Conversation.between(current_user, params[:match])
                                .first
                                .set_new(current_user)

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
end
