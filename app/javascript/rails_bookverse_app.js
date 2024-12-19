import initTheme from './color_modes';

let scrollToTopBtn = null;
let header = null;
let previous_event = null;

const scrollToTop = function() {
  window.scrollTo({
    top: 0,               // Scroll to the top of the page
    behavior: 'smooth'    // Smooth scroll effect
  });
};

// Show or hide the button based on scroll position
window.onscroll = function () {
  if (scrollToTopBtn) {
    if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
      scrollToTopBtn.style.display = 'block'; // Show button
    } else {
      scrollToTopBtn.style.display = 'none';  // Hide button
    }
  }
  
  if (header) {
    header.classList.toggle('shadow-sm', document.documentElement.scrollTop > 0);
  }
};

const app = (current_event) => {
  if (previous_event && previous_event !== current_event) {
    return;
  }

  console.log('Rails BookVerse is running at', new Date().toLocaleTimeString());

  initTheme();

  scrollToTopBtn = document.getElementById('scrollToTopBtn');
  if (scrollToTopBtn)
    scrollToTopBtn.addEventListener('click', scrollToTop);

  header = document.querySelector('header.header');

  setTimeout(() => {
    previous_event = null;
    current_event = null;
  }, 1000);

  previous_event = current_event;
};

addEventListener('turbo:load', () => {
  app('turbo:load');
});

addEventListener('turbo:render', () => {
  app('turbo:render');
});

addEventListener('turbo:click', () => {
  const divError = document.querySelector('form.model-form .error-messages');
  if (divError) {
    console.log('removing error messages');
    divError.remove();
  }
});
