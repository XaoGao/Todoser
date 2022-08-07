import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  received(data) {
    var level = data.level ? data.level : "info"
    switch (level) {
      case "success":
        toastr.success(data.message)
        break;
      case "info":
        toastr.info(data.message)
        break;
      case "warning":
        toastr.warning(data.message)
        break;
      case "error":
        toastr.error(data.message)
        break;
      default:
        toastr.info(data.message)
    }
  }
});
