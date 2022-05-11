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
    const url = this.data.get("url")
    const data = this.requestData(event)
    
    Rails.ajax({
      url: url,
      type: "PUT",
      data: data
    })
  }

  requestData(event) {
    const position = event.newIndex + 1
    const status = this.newStatus(event)

    var data = new FormData
    data.append("position", position)
    data.append("status", status)

    return data
  }

  newStatus(event) {
    const isEmptyList = event.to.attributes["id"] === undefined
    if(isEmptyList) {
      return event.to.attributes["current-status"].nodeValue
    } else {
      return event.to.attributes["id"].nodeValue.replace("tasks-list-", "")
    } 
  }
}
