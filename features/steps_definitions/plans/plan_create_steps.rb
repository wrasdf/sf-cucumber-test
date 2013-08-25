#!/bin/env ruby
# encoding: utf-8

When(/^我输入创建方案的内容$/) do

  @plan_page.link_to_create_plan_page
  @plan_page.enter_five_element_name "1.1.1招（含晋升）"
  @plan_page.enter_plan_name @current_plan_name
  @plan_page.enter_selected_level "集团关注"
  @plan_page.enter_owner_name "王五"
  @plan_page.enter_plan_description "方案的描述"
  @plan_page.enter_plan_comments "方案的评价标准"

  @plan_page.enter_step_description "步骤的描述"
  @plan_page.enter_start_date "2013-8-10"
  @plan_page.enter_end_date "2013-10-10"
  @plan_page.enter_department_name "集团"
  @plan_page.enter_step_comment "步骤的评价标准"

end

When(/^点击创建方案的按钮$/) do

  @plan_page.click_create_plan_button
  @plan_page.current_url.should include "/plan/initiations"

end

Then(/^我在方案列表中看见新创建的方案$/) do

  @plan_page.my_creator_ng_grid_rows.each_with_index do |row,index|
    if index == 0
      row.text.should include "1.1.1招（含晋升）"
      row.text.should include @current_plan_name
      row.text.should include "王五"
    end
  end

end








