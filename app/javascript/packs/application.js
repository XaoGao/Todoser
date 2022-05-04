import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "bootstrap"
import "../stylesheet/application.scss";
import "@fortawesome/fontawesome-free/css/all.css";

document.addEventListener("turbolinks:load", () => {
  
})