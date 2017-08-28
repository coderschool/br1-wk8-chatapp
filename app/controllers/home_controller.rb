class HomeController < ApplicationController
  def index
    ActionCable.server.broadcast("announcements", data: 123)
  end
end
