let scrollToTopBtn = null;
let app_initialized = false;

const scrollToTop = function() {
  window.scrollTo({
    top: 0,               // Scroll to the top of the page
    behavior: 'smooth'    // Smooth scroll effect
  });
};

// Show or hide the button based on scroll position
window.onscroll = function () {
  if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
    scrollToTopBtn.style.display = 'block'; // Show button
  } else {
    scrollToTopBtn.style.display = 'none';  // Hide button
  }
};

const app = () => {
  if (app_initialized) return;

  app_initialized = true;
  console.log('Rails BookVerse is running at', new Date().toLocaleTimeString());

  scrollToTopBtn = document.getElementById('scrollToTopBtn');
  scrollToTopBtn.addEventListener('click', scrollToTop);

  setTimeout(() => {
    app_initialized = false;
  }, 500);
};

addEventListener('turbo:load', app);
addEventListener('turbo:render', app);
addEventListener('turbo:click', (event) => {
  const divError = document.querySelector('form.model-form .error-messages');
  if (divError) {
    console.log('removing error messages');
    divError.remove();
  }
});
