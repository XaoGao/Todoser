import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "trix"
import "@rails/actiontext"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"
import "../stylesheet/application.scss";
import "@fortawesome/fontawesome-free/css/all.css";
import "../extensions/add-toastr"


document.addEventListener("turbolinks:load", () => {
})
