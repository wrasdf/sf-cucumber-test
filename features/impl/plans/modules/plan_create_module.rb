module Create_Plan
  def self.included(base)
    base.class_eval do

      element :five_element_input, '[name="fiveElementName"]'
      element :plan_name, '#name'
      element :selected_level, '.chosen-container'
      element :owner_name, '#token-input-owner'
      element :department_name,'[id^=token-input-department]'
      element :dropdown_item, '.token-input-dropdown li.token-input-selected-dropdown-item'
      element :plan_description_textarea, '[name="plan-description"]'
      element :plan_comment_textarea, '[name="plan-comment"]'
      element :step_description_textarea, '[name="description"]'
      element :step_comment_textarea, '[name="comments"]'
      element :start_date, '[name="startDate"]'
      element :end_date, '[name="endDate"]'

      def link_to_create_plan_page
        self.create_nav.click
        sleep 1
      end

      def enter_plan_name name
        self.plan_name.set name
      end

       def enter_selected_level name
        self.evaluate_script %Q| $("#level").val('0').trigger('chosen:updated').change(); |
        self.selected_level.set name
      end

      def enter_owner_name name
        self.owner_name.set name
        self.dropdown_item.click
      end


      def enter_plan_description descriptions
        self.plan_description_textarea.set descriptions
      end

      def enter_plan_comments comments
        self.plan_comment_textarea.set comments
      end

      def enter_step_description description
        self.step_description_textarea.set description
      end

      def enter_department_name department
        self.department_name.set department
        self.dropdown_item.click
      end

      def enter_step_comment description
        self.step_comment_textarea.set description
      end

      def click_create_plan_button
        self.evaluate_script %Q| $("[name='confirm-create-plan']").trigger('click') |
        sleep 4
      end

    end
  end
end