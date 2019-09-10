class ConversationsController < ApplicationController

  def index
    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.where(recipient_id: current_user.id).or(Conversation.where(sender_id: current_user.id))
  end

  def create
    @conversation = Conversation.get(current_user.id, params[:user_id])
    @is_new_conversation = @conversation.id.nil?
    @conversation.save!
    message = Message.new(body: params[:conversation][:content])
    message.conversation = @conversation
    message.user = current_user
    message.save!
    respond_to do |format|
      format.js
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order(id: :asc)
    # cant seem to update and query at the same time, calling update seperately below
    @messages.update_all(read: true)
    respond_to do |format|
      format.js
    end
  end
end
