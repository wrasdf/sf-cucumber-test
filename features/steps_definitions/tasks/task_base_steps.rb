#!/bin/env ruby
# encoding: utf-8

Given(/^I am "张三" to login the system$/) do
  @task_page = TaskPage.new
  @task_page.load
  @current_task_name = "CT-#{Time.now.strftime("%Y/%m/%d - %I:%M")}"
end

Given(/^I create a new task$/) do
  @task_page.link_to_create_task_page
  @task_page.enter_five_element_name "1.1.1招（含晋升）"
  @task_page.enter_task_name @current_task_name
  @task_page.enter_task_description "The description for this task"
  @task_page.enter_task_receiver_name "张三"
  @task_page.enter_start_date "2013-8-27"
  @task_page.enter_end_date "2013-9-27"
  @task_page.enter_review_date "2013-9-2"
  @task_page.click_confirm_button
end
