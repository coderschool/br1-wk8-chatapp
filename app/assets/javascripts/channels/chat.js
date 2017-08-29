// only set up room for the currently visited room
function setupRoom(roomId) {
  console.log('subscribing to chat with id', roomId);
  App.chat = App.cable.subscriptions.create(
    { channel: 'ChatChannel', id: roomId },
    {
      connected: function() {
        // Called when the subscription is ready for use on the server
        console.log('connected', this);
      },

      disconnected: function() {
        // Called when the subscription has been terminated by the server
        console.log('#ChanChannel disconnected');
      },

      received: function(data) {
        // Called when there's incoming data on the websocket for this channel
        console.log('#ChatChannel received:', data);
        $('.js-chat-messages').append(data.html);
      }
    }
  );
}

console.log('chat.js');
