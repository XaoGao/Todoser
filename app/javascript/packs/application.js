import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"
import "../stylesheet/application.scss";
import "@fortawesome/fontawesome-free/css/all.css";
import Sortable from 'sortablejs';

document.addEventListener("turbolinks:load", () => {
  var els = document.getElementsByClassName('list-group');
  for (let index = 0; index < els.length; index++) {
    const element = els[index];
    var sortable = Sortable.create(element);
    
  }
})

