class BroadcastJs
  def self.notify(model, template, assigns)
    script = ApplicationController.render(template, format: :js, assigns: assigns)
    MessagesChannel.broadcast_to model, notify: 'script', script: script
  end

  def self.notify_message(message, action_name)
    notify(message.chatroom, "broadcast/messages/#{action_name}", message: message)
  end
end
