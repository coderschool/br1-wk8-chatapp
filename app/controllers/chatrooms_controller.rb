class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find params[:id]
    @message = @chatroom.messages.build
  end

  def create
    @chatroom = Chatroom.new chatroom_params

    if @chatroom.save
      redirect_to @chatroom
    else
      redirect_back fallback_location: root_path
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
