function setupMessages(roomId) {
  App.messages = App.cable.subscriptions.create(
    { channel: 'MessagesChannel', id: roomId },
    {
      connected: function() {
        // Called when the subscription is ready for use on the server
        console.log('#messages connected at ', this.identifier);
      },

      disconnected: function() {
        // Called when the subscription has been terminated by the server
      },

      received: function(data) {
        // Called when there's incoming data on the websocket for this channel
        console.log('#messages received: ', data);

        switch (data.notify) {
          case 'new':
            $('.chat-messages').append(data.html);
            break;
          case 'destroy':
            $('#' + data.dom_id).remove();
            break;
          case 'script':
            eval(data.script);
            break;
          default:
            console.log('unrecognized data.notify');
            break;
        }
      }
    }
  );
}
