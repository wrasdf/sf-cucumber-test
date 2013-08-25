module Create_Task
  def self.included(base)
    base.class_eval do

      element :section_content, 'section.content'
      element :five_element_input, '.five-element-name'
      element :task_name, '.task-name'
      element :task_description_textarea, '.task-description'
      element :receiver_name, '#token-input-receiver'
      element :receiver_name_dropdown, '.token-input-dropdown'
      element :receiver_name_dropdown_item, '.token-input-dropdown li.token-input-selected-dropdown-item'
      element :receiver_name_result, '.token-input-list .token-input-token p'
      element :start_date, '#startDate'
      element :end_date, '#endDate'
      element :review_date, '#reviewDate'
      element :follow_level, '#level_chosen .chosen-single span'

      def link_to_create_task_page
        self.create_nav.click
        sleep 2
      end

      def enter_task_name (name)
        self.task_name.set name
      end

      def enter_follow_level follow_level
        self.follow_level.set follow_level
      end

      def enter_task_description (descriptions)
        self.task_description_textarea.set descriptions
      end

      def enter_task_receiver_name (name)
        self.receiver_name.set name
        self.receiver_name_dropdown_item.click
      end

      def click_confirm_button
        sleep 1
        self.evaluate_script %Q| $("button.confirm-create-task").trigger('click') |
        sleep 3
      end

    end
  end
end