#!/bin/env ruby
# encoding: utf-8

@task
Feature: When user 张三 login and navigate to the task page, she/he could create a new task.

  Background:
    Given I am "张三" to login the system
    And navigate to create task page

  Scenario: Create new task

    When user input details for create new task
    And click confirm button
    Then user could see the new task will on the top of the task list


