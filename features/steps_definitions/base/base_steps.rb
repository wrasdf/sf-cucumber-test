#!/bin/env ruby
# encoding: utf-8

Given(/^用户退出$/) do
  @plan_page.click_logout
  sleep 3
end