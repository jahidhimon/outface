import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbartoggle"
export default class extends Controller {
	static targets = ['menu']
	connect() {
		console.log('navbartoggle connected')
	}
	menu() {
		this.menuTarget.classList.toggle('hidden')
	}
}
