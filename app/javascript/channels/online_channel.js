import consumer from "./consumer"

consumer.subscriptions.create("OnlineChannel", {
  connected() {},
  disconnected() {},
  received(data) {}
});
