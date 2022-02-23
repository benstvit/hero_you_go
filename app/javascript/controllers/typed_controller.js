import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';
export default class extends Controller {

  connect() {

var options = {
  strings: ['Their Super Powers...', 'are YOURS !'],
  typeSpeed: 30,
  showCursor: false,
  loop: true
};

var typed = new Typed('.typed-target', options);

  }
}
