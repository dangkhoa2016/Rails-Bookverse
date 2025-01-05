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

  handleNewTabContent() {
    if (!this.currentTabPane)
      return;

    setSvgIconPath(this.currentTabPane.querySelectorAll('use[data-icon]'));

    const elements = this.currentTabPane.querySelectorAll('.switch-display a[data-url]');
    if (!elements)
      return;

    elements.forEach(element => {
      element.addEventListener('click', this.loadDisplayView.bind(this));
    });
  }

  loadDisplayView(event) {
    event.preventDefault();

    const url = event.currentTarget.getAttribute('data-url');
    if (!url)
      return;

    fetch(url)
      .then(response => response.text())
      .then(html => {
        this.currentTabPane.innerHTML = html;

        this.handleNewTabContent();
      }).catch(error => {
        console.log('loadDisplayView failed to load view:', error);
      });
  }

  loadRemoteContent(event) {
    const targetTabPaneId = event.currentTarget.getAttribute('aria-controls');
    const tabContentElement = document.getElementById(targetTabPaneId);
    if (!tabContentElement || tabContentElement.childNodes.length > 0)
      return;

    const url = event.currentTarget.getAttribute('data-url');
    if (!url)
      return;

    fetch(url)
      .then(response => response.text())
      .then(html => {
        tabContentElement.innerHTML = html;

        this.handleNewTabContent();
      }).catch(error => {
        console.log('loadRemoteContent failed to load content:', error);
      });
  }
}
