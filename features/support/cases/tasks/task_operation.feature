#!/bin/env ruby
# encoding: utf-8
@task
Feature: 承接人接受或者拒绝任务

  Background:

    Given I am "张三" to login the system
    And I create a new task

  Scenario: 接受任务

    When 我在该任务详情页面点击“接受任务”
    Then 该任务出现在“我的承接”的“已承接”列表
    And 该任务出现在“我的承接”的“全部”列表


  Scenario: 拒绝任务

    When 我在该任务详情页面点击“拒绝任务”
    Then 该任务出现在“我的承接”的“已拒绝”列表
    And 该任务出现在“我的承接”的“全部”列表