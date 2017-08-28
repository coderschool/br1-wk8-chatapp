App.announcements = App.cable.subscriptions.create('AnnouncementsChannel', {
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.log('connected', this);
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
    console.log('disconnected');
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('received', data);
    // insert anouncement into page
    if (data.html) {
      $('.navbar').after(data.html);
    }
  }
});

console.log('announcements');
