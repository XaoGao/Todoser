import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require("trix")
require("@rails/actiontext")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"
import "../stylesheet/application.scss";
import "@fortawesome/fontawesome-free/css/all.css";

document.addEventListener("turbolinks:load", () => {
  
})
