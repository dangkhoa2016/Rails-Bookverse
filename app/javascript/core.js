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

// Show or hide the button based on scroll position
window.onscroll = function () {
  if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
    scrollToTopBtn.style.display = 'block'; // Show button
  } else {
    scrollToTopBtn.style.display = 'none';  // Hide button
  }
};

// Get the button element
const scrollToTopBtn = document.getElementById('scrollToTopBtn');
scrollToTopBtn.addEventListener('click', scrollToTop);
