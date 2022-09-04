import Rails from "@rails/ujs"
import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  click() {
    Rails.ajax({
      url: this.urlValue,
      type: "GET",
      success: function(response) {
        var payload = JSON.parse(response)
        $("#modal").modal("show");
        $("#modal-body").html(payload.data);
      },
      error: function(response) {
        toastr.error(response)
      }
    })
  }
}
