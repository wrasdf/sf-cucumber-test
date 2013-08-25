module My_Receiver_Task
  def self.included(base)
    base.class_eval do
      element :my_receiver_content, '.initiationsList'
      element :receiver_task_title, '.info > h2'
      element :accept_task_button, '.accept-task'
      element :reject_task_button, '.reject-task'
      element :my_receiver_already_accept_tab, '.init_tab .my-already-accept'
      element :my_receiver_all_tab, '.init_tab .my-all'
      elements :my_receiver_ng_grid_rows, '.ngViewport .ngCanvas > .ng-scope'
      element :my_receiver_reject_textarea, '.form-confirm textarea'
      element :reject_form_confirm_button, '.modal-footer .confirm-button'
      element :my_receiver_rejected_tab, '.init_tab .my-reject'
      element :my_receiver_table, '.gridStyle .ngViewport'

      def link_to_my_receiver_page
        self.my_receiver_nav.click
        sleep 2
      end

      def accept_task
        self.accept_task_button.click
      end

      def reject_task
        self.reject_task_button.click
      end

      def enter_my_receiver_task_detail_page
        self.link_to_my_receiver_page
        sleep 1
        self.click_first_row_of_task_list
      end

      def click_my_receiver_already_accepted_tab_button
        self.my_receiver_already_accept_tab.click
        sleep 1
      end

      def click_my_receiver_all_tab_button
        self.my_receiver_all_tab.click
        sleep 1
      end

      def input_text_in_reject_textarea reject_reason
        # code here
        self.my_receiver_reject_textarea.set reject_reason
      end

      def click_reject_confirm_button
        self.reject_form_confirm_button.click
        sleep 2
      end

      def click_rejected_tab
        self.my_receiver_rejected_tab.click
        sleep 1
      end

    end
  end
end