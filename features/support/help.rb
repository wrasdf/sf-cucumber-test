require "Capybara"
require "rspec"
require "Capybara/rspec"
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'site_prism'

Dir[File.dirname(__FILE__) + '/../impl/**/*.rb'].each { |file| require file }

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


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

#require './features/support/help.rb'
#@task_page = TaskPage.new
#@task_page.load