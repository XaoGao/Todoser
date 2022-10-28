import Rails from "@rails/ujs"
import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = [ "dropdown" ]
  static values = {
    url: String
  }

  click() {
    if (this.dropdownTarget.childElementCount > 2) {
      return
    }
    Rails.ajax({
      url: this.urlValue,
      type: "GET",
      success: (response) => {
        this.loadItems(response.data)
      },
      error: (response) => {
        toastr.error(response)
      }
    })
  }

  loadItems(data) {
    const items = JSON.parse(data)
    items.data.forEach(item => {
      const link = document.createElement("a")
      var linkText = document.createTextNode(item.attributes.text)
      link.appendChild(linkText);
      link.classList.add("dropdown-item")
      link.href = item.attributes.link
      this.dropdownTarget.insertBefore(link, this.dropdownTarget.children[0])
    }) 
  }
}
