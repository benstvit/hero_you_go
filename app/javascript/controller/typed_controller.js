import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]

  connect() {

    // var typed = new Typed('.element', {
    //   strings: ["First sentence.", "Second sentence."],
    //   typeSpeed: 30
    // });

    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
