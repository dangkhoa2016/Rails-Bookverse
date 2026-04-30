require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [ 1400, 1400 ] do |options|
    options.add_argument("--headless=new")
    options.add_argument("--window-size=1400,1400")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--disable-gpu")
    options.add_argument("--disable-software-rasterizer")
    options.add_argument("--disable-extensions")
    options.add_argument("--no-zygote")
  end

  def after_teardown
    driver = Capybara.current_session.driver

    super
  ensure
    begin
      browser = driver&.instance_variable_get(:@browser)
      browser&.quit
      driver&.instance_variable_set(:@browser, nil)
    rescue Selenium::WebDriver::Error::WebDriverError, Errno::ECONNREFUSED, IOError
      nil
    end
  end
end
