import consumer from "channels/consumer"

function connect_to_home() {
  consumer.subscriptions.create("HomeChannel", {
    connected() {
      console.log('connected')
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
    }
  });
};

export { connect_to_home }