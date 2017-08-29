class ChatroomsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @chatroom = Chatroom.find params[:id]
    @message = Message.new
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
