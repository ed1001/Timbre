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
    message.update(conversation: @conversation, user: current_user)
    respond_to do |format|
      format.js
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order(id: :asc)
    @messages.where.not(sender: current_user).where(read: false).update_all(read: true)
    # extract 'read' attribute/s to conversation instead of message so you only have to check one thing each time you update. Will leave until later as will take more time
    respond_to do |format|
      format.js
    end
  end
end
