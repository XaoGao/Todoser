import Rails from "@rails/ujs"
import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  getInvitation() {
    Rails.ajax({
      url: this.urlValue,
      type: "GET",
      success: (response) => {
        this.dispatch("showInvitation", {detail: { payload: response.data }})
      },
      error: (response) => {
        toastr.error(response)
      }
    })
  }
}
