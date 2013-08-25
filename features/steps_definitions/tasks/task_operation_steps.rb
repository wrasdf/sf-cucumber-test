#!/bin/env ruby
# encoding: utf-8

When(/^我在该任务详情页面点击“接受任务”$/) do
  @task_page.link_to_my_receiver_page
  @task_page.click_first_row_of_task_list
  @task_page.receiver_task_title.text.should include @current_task_name
  @task_page.accept_task
end

Then(/^该任务出现在“我的承接”的“已承接”列表$/) do
  @task_page.link_to_my_receiver_page
  @task_page.click_my_receiver_already_accepted_tab_button
  @task_page.my_receiver_ng_grid_rows.each_with_index do |row,index|
    if index == 0
      row.text.should include "1.1.1招（含晋升）"
      row.text.should include @current_task_name
      row.text.should include "张三"
    end
  end

end

Then(/^该任务出现在“我的承接”的“全部”列表$/) do

  @task_page.click_my_receiver_all_tab_button
  @task_page.my_receiver_ng_grid_rows.each_with_index do |row,index|
    if index == 0
      row.text.should include "1.1.1招（含晋升）"
      row.text.should include @current_task_name
      row.text.should include "张三"
    end
  end

end

When(/^我在该任务详情页面点击“拒绝任务”$/) do
  @task_page.link_to_my_receiver_page
  @task_page.click_first_row_of_task_list
  @task_page.receiver_task_title.text.should include @current_task_name
  @task_page.reject_task
end

Then(/^该任务出现在“我的承接”的“已拒绝”列表$/) do
  @task_page.input_text_in_reject_textarea "reject reason"
  @task_page.click_reject_confirm_button
  @task_page.current_url.should include "/tasks/receiver"
  @task_page.click_rejected_tab
  @task_page.my_receiver_table.text.should include @current_task_name
end
