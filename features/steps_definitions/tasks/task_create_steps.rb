#!/bin/env ruby
# encoding: utf-8

Given /^navigate to create task page$/ do
  @task_page.link_to_create_task_page
  @task_page.current_url.should include "/task/new"
end

When(/^user input details for create new task$/) do
  step %{I create a new task}
end

When(/^click confirm button$/) do
  @task_page.click_confirm_button
  @task_page.current_url.should include "/tasks/creator"
end

Then(/^user could see the new task will on the top of the task list$/) do

  @task_page.my_creator_ng_grid_rows.each_with_index do |row,index|
    if index == 0
      row.text.should include "1.1.1招（含晋升）"
      row.text.should include @current_task_name
      row.text.should include "张三"
    end
  end

  @task_page.link_to_my_receiver_page
  @task_page.current_url.should include "/tasks/receiver"
  @task_page.my_receiver_ng_grid_rows.each_with_index do |row,index|
    if index == 0
      row.text.should include "1.1.1招（含晋升）"
      row.text.should include @current_task_name
      row.text.should include "张三"
    end
  end

end






