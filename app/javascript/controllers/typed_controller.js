import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';
export default class extends Controller {

  connect() {

var options = {
  strings: ['His powers...', 'are YOURS !'],
  typeSpeed: 40
};

var typed = new Typed('.typed-target', options);
    console.log("Hello, Stimulus!", this.element)
  }
}
