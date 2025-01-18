# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin 'app_theme', to: 'app_theme.js'

# only use for home page
pin 'chart_bundle', to: 'chart_bundle.js', preload: false
pin '@coreui/utils', to: 'coreui_utils.js', preload: false
# pin '@coreui/utils', to: 'https://cdn.jsdelivr.net/npm/@coreui/utils@2.0.2/+esm'
pin 'home', to: 'home.js', preload: false
# only use for home page

pin 'choices.js', to: 'https://cdn.jsdelivr.net/npm/choices.js@11.0.2/+esm'

pin_all_from 'app/javascript/controllers', under: 'controllers'
