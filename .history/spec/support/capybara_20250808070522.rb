# spec/support/capybara.rb
require 'capybara/rspec'
require 'selenium/webdriver'

Capybara.configure do |config|
  # URL base usada nos testes de sistema
  config.app_host = "http://localhost:3000"

  # Tempo máximo de espera para encontrar elementos
  config.default_max_wait_time = 5

  # Driver padrão (headless Chrome)
  config.default_driver = :selenium_chrome_headless
  config.javascript_driver = :selenium_chrome_headless
end

# Registrando driver Chrome visível (para debug)
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# Registrando driver Chrome headless (usado por padrão)
Capybara.register_driver :selenium_chrome_headless do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.add_argument('--headless=new') # modo headless moderno
      opts.add_argument('--disable-gpu')
      opts.add_argument('--no-sandbox')
      opts.add_argument('--disable-dev-shm-usage')
      opts.add_argument('--window-size=1400,1400')
    end
  )
end
