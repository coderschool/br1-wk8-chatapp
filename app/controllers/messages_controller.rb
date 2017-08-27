class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chatroom = Chatroom.find params[:chatroom_id]
    @message = @chatroom.messages.build message_params
    @message.user = current_user
    if @message.save
      # ... extra things we will do later
      BroadcastJs.notify_message(@message, action_name)
    end

    respond_to do |format|
      format.html do
        if @message.persisted?
          redirect_to @chatroom
        else
          render 'new'
        end
      end
      format.js
    end
  end

  def destroy
    @message = Message.find params[:id]
    BroadcastJs.notify_message(@message, action_name)
    @message.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
