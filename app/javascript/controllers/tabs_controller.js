import { Controller } from '@hotwired/stimulus';
import { setSvgIconPath } from '../rails_bookverse_app';

export default class extends Controller {

  get tabHeaderElements() {
    return this.element.querySelectorAll('ul.nav > li a');
  }

  get currentTabPane() {
    return this.element.querySelector('.tab-content .tab-pane.active');
  }

  connect() {
    this.tabHeaderElements.forEach(tabHeaderElement => {
      this.handleTabHeaderClick(tabHeaderElement);

      if (tabHeaderElement.getAttribute('aria-selected') === 'true')
        this.loadRemoteContent({ currentTarget: tabHeaderElement });
    });
  }

  handleTabHeaderClick(tabHeaderElement) {
    const tabTrigger = new coreui.Tab(tabHeaderElement);

    tabHeaderElement.addEventListener('click', event => {
      event.preventDefault();

      tabTrigger.show();

      this.loadRemoteContent(event);
    });
  }

  handleNewTabContent(tab) {
    if (!tab)
      tab = this.currentTabPane;
    if (!tab)
      return;

    setSvgIconPath(tab.querySelectorAll('use[data-icon]'));

    const elements = tab.querySelectorAll('.switch-display a[data-url]');
    if (!elements)
      return;

    elements.forEach(element => {
      element.addEventListener('click', this.loadDisplayView.bind(this));
    });
  }

  createLoadingElement() {
    const div = document.createElement('div');
    div.setAttribute('class', 'loading-wrapper py-5 rounded text-center position-absolute start-0 end-0 bottom-0 top-0');
    const loadingElement = document.querySelector('#loading');
    let spinner = null;
    if (!loadingElement) {
      spinner = document.createElement('div');
      spinner.classList.add('spinner-border', 'text-primary');
    } else {
      spinner = loadingElement.cloneNode(true);
      spinner.classList.remove('d-none');
    }

    div.appendChild(spinner);
    return div;
  }

  loadDisplayView(event, tab) {
    if (event.preventDefault)
      event.preventDefault();

    if (!tab)
      tab = this.currentTabPane;
    if (!tab)
      return;

    const url = event.currentTarget.getAttribute('data-url');
    if (!url)
      return;

    if (tab.classList.contains('loading'))
      return;

    tab.classList.add('loading');
    tab.appendChild(this.createLoadingElement());

    fetch(url)
      .then(response => response.text())
      .then(html => {
        tab.innerHTML = html;
        tab.classList.remove('loading');

        this.handleNewTabContent(tab);
      }).catch(error => {
        tab.classList.remove('loading');
        console.log('loadDisplayView failed to load view:', error);
      });
  }

  loadRemoteContent(event) {
    const targetTabPaneId = event.currentTarget.getAttribute('aria-controls');
    const tabContentElement = document.getElementById(targetTabPaneId);
    if (!tabContentElement || tabContentElement.childNodes.length > 0)
      return;

    this.loadDisplayView(event, tabContentElement);
  }
}
