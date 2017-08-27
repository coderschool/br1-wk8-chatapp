class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chatroom = Chatroom.find params[:chatroom_id]
    @message = @chatroom.messages.build message_params
    @message.user = current_user
    if @message.save
      # ... extra things we will do later
      redirect_to @chatroom
    else
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
