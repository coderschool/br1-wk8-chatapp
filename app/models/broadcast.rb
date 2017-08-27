class Broadcast
  def self.notify_new_message(message)
    MessagesChannel.broadcast_to message.chatroom, notify: 'new', html: to_html(message)
  end

  def self.notify_destroyed_message(message)
    MessagesChannel.broadcast_to message.chatroom, notify: 'destroy', dom_id: dom_id(message)
  end

  def self.to_html(message)
    # render partial messages/_message with self passed as the message local variable
    ApplicationController.render(message)
  end

  def self.dom_id(message)
    ApplicationController.helpers.dom_id(message)
  end
end