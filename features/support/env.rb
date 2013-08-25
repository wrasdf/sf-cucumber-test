require 'yaml'
require "Capybara"
require "rspec"
require "Capybara/rspec"
require "Capybara/cucumber"
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'site_prism'

Dir[File.dirname(__FILE__) + '/impl/**/*.rb'].each { |file| require file }

BASE_URL = YAML.load_file(File.dirname(__FILE__) + '/cucumber.yml')[ENV['env']]["base_url"]

if ENV['HEADLESS'] == 'true'

  Capybara.default_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
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
    config.default_driver = :chrome
    config.javascript_driver = :chrome
    config.run_server = false
    config.default_selector = :css
    config.default_wait_time = 5

    #capybara 2.1 config options
    config.match = :prefer_exact
    config.ignore_hidden_elements = false
  end

  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

end
