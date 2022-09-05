import { Controller } from "stimulus"

export default class extends Controller {
  show({ detail: { payload } }) {
    $("#modal").modal("show")
    $("#modal-body").html(payload)
  }
}
