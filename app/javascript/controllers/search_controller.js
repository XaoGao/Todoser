import Rails from "@rails/ujs"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name" ]

  clear(e) {
    e.preventDefault();
    const element = this.nameTarget
    element.value = ""
  }
}
