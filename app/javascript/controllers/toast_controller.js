import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toast"
export default class extends Controller {
  connect() {
		setTimeout(() => {
			this.hide()
		}, 2000)
  }
	hide() {
		this.element.classList.add("hidden")
	}
}
