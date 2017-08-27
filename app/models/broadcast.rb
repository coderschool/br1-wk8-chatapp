class Broadcast
  def self.notify_new_message(message)
    MessagesChannel.broadcast_to message.chatroom, html: to_html(message), notify: 'new'
  end

  def self.to_html(message)
    # render partial messages/_message with self passed as the message local variable
    ApplicationController.render(message)
  end
end