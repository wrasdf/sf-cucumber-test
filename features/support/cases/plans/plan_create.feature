#!/bin/env ruby
# encoding: utf-8

@plan
Feature: 王五 登陆系统并进入方案页面, 可以创建方案。

  Background:
    Given 我是"王五"登陆方案创建页面

  Scenario: 创建新的方案

    When 我输入创建方案的内容
    And 点击创建方案的按钮
    Then 我在方案列表中看见新创建的方案
