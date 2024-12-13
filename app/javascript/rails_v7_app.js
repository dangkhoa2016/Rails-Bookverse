import './color_modes';

const handleLinksClick = () => {
  const linkCollection = document.querySelectorAll('a[data-turbo-frame="_top"].model-link');
  if (linkCollection.length > 0) {
    linkCollection.forEach((link) => {
      link.addEventListener('click', (event) => {
        const divError = document.querySelector('form.model-form .error-messages');
        if (divError) {
          console.log('removing error messages');
          divError.remove();
        }
      });
    });
  }
};

addEventListener('turbo:load', handleLinksClick);

addEventListener('turbo:render', handleLinksClick);


const scrollToTop = function() {
  window.scrollTo({
    top: 0,               // Scroll to the top of the page
    behavior: 'smooth'    // Smooth scroll effect
  });
};

const header = document.querySelector('header.header');

// Show or hide the button based on scroll position
window.onscroll = function () {
  if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
    scrollToTopBtn.style.display = 'block'; // Show button
  } else {
    scrollToTopBtn.style.display = 'none';  // Hide button
  }

  if (header) {
    header.classList.toggle('shadow-sm', document.documentElement.scrollTop > 0);
  }
};

// Get the button element
const scrollToTopBtn = document.getElementById('scrollToTopBtn');
scrollToTopBtn.addEventListener('click', scrollToTop);

