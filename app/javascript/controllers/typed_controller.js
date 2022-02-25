import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';
export default class extends Controller {

  connect() {

    let options = {
      strings: ['Their Super Powers...', 'are YOURS !'],
      typeSpeed: 80,
      showCursor: false,
      loop: true
    };

    let typed = new Typed('.typed-target', options);

  }
}
