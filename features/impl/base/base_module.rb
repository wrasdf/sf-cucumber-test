module Base_Module
  def self.included(base)
    base.class_eval do

      element :five_element_input, '[name="fiveElementName"]'
      element :user_name_input, '[name="j_username"]'
      element :pwd_input, '[name="j_password"]'
      element :submit_button, '[name="submit"]'
      element :tab_dashboard, '.dashboard'
      element :tab_plan, '.projects'
      element :tab_task, '.task'
      element :tab_share, '.viewables'
      element :logout, '.logout'

      def enter_five_element_name (name)
        self.five_element_input.set name
      end

      def enter_start_date (date)
        self.evaluate_script %Q| $("[name='startDate']").datepicker("setDate","#{date}")|
        self.evaluate_script %Q| $("[name='startDate']").trigger('change') |
        self.evaluate_script %Q| $("#ui-datepicker-div").hide(); |
      end

      def enter_end_date (date)
        self.evaluate_script %Q| $("[name='endDate']").datepicker("setDate","#{date}")|
        self.evaluate_script %Q| $("[name='endDate']").trigger('change') |
        self.evaluate_script %Q| $("#ui-datepicker-div").hide(); |
      end

      def enter_review_date (date)
        self.evaluate_script %Q| $("[name='reviewDate']").datepicker("setDate","#{date}")|
        self.evaluate_script %Q| $("[name='reviewDate']").trigger('change') |
        self.evaluate_script %Q| $("#ui-datepicker-div").hide(); |
        end

      def click_logout
        self.logout.click
      end

      def enter_user_name(name)
        self.user_name_input.set name
      end

      def enter_pwd(pwd)
        self.pwd_input.set pwd
      end

      def click_login_button
        self.submit_button.click
      end

      def click_plan_tab
        self.tab_plan.click
      end

    end
  end
end