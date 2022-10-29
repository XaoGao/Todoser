import Rails from "@rails/ujs"
import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  getTask() {
    Rails.ajax({
      url: this.urlValue,
      type: "GET",
      success: (response) => {
        this.dispatch("showTask", {detail: { payload: response.data }})
      },
      error: (response) => {
        toastr.error(response)
      }
    })
  }
}
