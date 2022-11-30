import Rails from "@rails/ujs"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["jobCard"]
  static values = {
    status: String,
    name: String,
    url: String
  }

  toggle() {
    Rails.ajax({
      url: this.urlValue,
      type: "PUT",
      success: (response) => {
        toastr.success(response.message)
        const el = document.getElementById(response.name)
        // TODO: fix
        el.innerHTML = response.html
      },
      error: (error) => {
        toastr.error(error.message)
      }
    })
  }

  launch() {
    Rails.ajax({
      url: this.urlValue,
      type: "PUT",
      success: (response) => {
        toastr.success(response.message)
        const el = document.getElementById(response.name)
        // TODO: fix
        el.innerHTML = response.html
      },
      error: function(error) {
        toastr.error(error.message)
      }
    })
  }
}
