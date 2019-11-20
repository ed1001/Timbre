class ConversationsController < ApplicationController
  def index
    @new_matches = Conversation.fetch_new_matches(current_user)
    @conversations = Conversation.fetch_active_conversations(current_user)
  end

  def create
    @conversation = Conversation.check_conversation(current_user, User.find(params[:user_id]))
  end

  def start
    @conversation = Conversation.between(current_user, params[:match])
                                .first
                                .set_new(current_user)
    @opposed_user_id = @conversation.opposed_user(current_user).id

    respond_to do |format|
      format.js
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order(id: :asc)
    @conversation.mark_as_read(current_user, true)

    respond_to do |format|
      format.js
    end
  end

  def mark_current_as_read
    Conversation.find(params[:id]).mark_as_read(current_user, true)
  end
end
