import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
// application.debug = true;

application.handleError = (error, message, detail) => {
  console.log('[application.handleError]', error, message, detail)
}

window.Stimulus   = application;

export { application }
