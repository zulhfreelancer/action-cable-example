App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#message_content").val("");
    $('.room_' + data.room_id).removeClass('hidden');
    return $('.room_' + data.room_id).append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});
