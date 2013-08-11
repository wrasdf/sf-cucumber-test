#!/bin/env ruby
# encoding: utf-8

Given /^a user login the page$/ do
  @task_page = TaskPage.new
  @task_page.load
end

When /^the user click the create item on the navigation bar$/ do
  @task_page.create_nav.click
  @task_page.current_url.should include "task/new"
end

Then /^the create page content will show to us$/ do
  @task_page.section_content.find("form.new-task h2").text.should include "新建日常任务"
end