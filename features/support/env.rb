Dir[File.dirname(__FILE__) + '/libs/*/*.rb'].each { |file| require file }

require "Capybara"
require "rspec"
require "Capybara/rspec"
require "Capybara/cucumber"
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'site_prism'

if ENV['HEADLESS'] == 'true'

  Capybara.default_driver = :poltergeist
  Capybara.register_driver :poltergeist do |app|
    options = {
        :js_errors => true,
        :timeout => 120,
        :debug => false,
        :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
        :inspector => true,
    }
    Capybara::Poltergeist::Driver.new(app, options)
  end

else

  Capybara.configure do |config|
    config.default_driver = :selenium
    config.javascript_driver = :selenium
    config.run_server = false
    config.default_selector = :css
    config.default_wait_time = 5

    #capybara 2.1 config options
    config.match = :prefer_exact
    config.ignore_hidden_elements = false
  end

  Capybara.register_driver :selenium do |app|
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile["browser.cache.disk.enable"] = false
    profile["browser.cache.memory.enable"] = false
    Capybara::Selenium::Driver.new(app, :browser => :firefox, profile: profile)
  end

end
