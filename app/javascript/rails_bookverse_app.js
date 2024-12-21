import initTheme from './color_modes';

let scrollToTopBtn = null;
let header = null;
let previousEvent = null;

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

const setSvgIconPath = () => {
  const useElements = document.querySelectorAll('use[data-icon]');
  useElements.forEach((use) => {
    const iconVariable = use.getAttribute('data-icon');
    if (!iconVariable) return;
    let iconPath = getComputedStyle(document.documentElement).getPropertyValue(iconVariable).trim();
    if (!iconPath) return;
    iconPath = iconPath.replace('url(', '').replace(')', '');
    const icon = use.getAttribute('xlink:href');
    if (!icon || icon.indexOf('#') !== 0) return;

    use.setAttribute('xlink:href', `${iconPath}${icon}`);
  });
};

const app = (currentEvent) => {
  if (previousEvent && previousEvent !== currentEvent) {
    return;
  }

  console.log('Rails BookVerse is running at', new Date().toLocaleTimeString());

  initTheme();

  setSvgIconPath();

  scrollToTopBtn = document.getElementById('scrollToTopBtn');
  if (scrollToTopBtn)
    scrollToTopBtn.addEventListener('click', scrollToTop);

  header = document.querySelector('header.header');

  setTimeout(() => {
    previousEvent = null;
    currentEvent = null;
  }, 1000);

  previousEvent = currentEvent;
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
