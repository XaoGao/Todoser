import Rails from "@rails/ujs"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["icon"]

  connect() {
    
  }

  click() {
    const status = this.data.get("status")
    const data = this.formData()

    // TODO: or use just status == true ?
    if(status === "true") {
      this.destroy(data)
    } else {
      this.create(data)
    }
  }

  change(){
    if (this.iconTarget.classList.contains("fa-regular")) {
      this.iconTarget.classList.replace("fa-regular", "fa-solid");
      this.iconTarget.classList.add("favorited")
    } else {
      this.iconTarget.classList.replace("fa-solid", "fa-regular");
      this.iconTarget.classList.remove("favorited")
    }
  }

  formData() {
    const type = this.data.get("type")
    const id = this.data.get("id")

    var data = new FormData
    data.append("favoriteable_type", type)
    data.append("favoriteable_id", id)

    return data
  }

  create(formData) {
    Rails.ajax({
      url: "/favorites",
      type: "POST",
      data: formData,
      success: this.change(),
      error: function(data) {
        // TODO: refactor show notification like toast
        console.log(data) 
      }
    })
  }

  destroy(formData) {
    Rails.ajax({
      url: "/favorites",
      type: "DELETE",
      data: formData,
      success: this.change(),
      error: function(data) {
        // TODO: refactor show notification like toast
        console.log(data) 
      }
    })
  }
}
