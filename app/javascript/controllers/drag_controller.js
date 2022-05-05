import Rails from "@rails/ujs"
import { Controller } from "stimulus"
import Sortable from 'sortablejs';

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, 
    { 
      group: 'shared', 
      animation: 150,
      onEnd: this.end.bind(this)
    });
  }

  end(event) {
    var status = event.to.attributes["current-status"].nodeValue
    var position = event.newIndex + 1
    var url = this.data.get("url")
    var data = new FormData
    data.append("position", position)
    data.append("status", status)
    
    Rails.ajax({
      url: url,
      type: "PUT",
      data: data
    })
  }
}
