import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';
export default class extends Controller {

  connect() {

var options = {
  strings: ['Their Super Powers...', 'are YOURS !'],
  typeSpeed: 40
};

var typed = new Typed('.typed-target', options);

  }
}
