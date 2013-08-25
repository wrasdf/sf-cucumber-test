module Base_Task
  def self.included(base)
    base.class_eval do

      set_url "#{BASE_URL}/task/index.htm"
      element :create_nav, '.nav-sidebar li.create a'
      element :my_receiver_nav, '.nav-sidebar li.assignments a'
      element :my_creator_nav, '.nav-sidebar li.initiations a'

      def click_first_row_of_task_list
        self.evaluate_script %Q| $(".ngViewport > .ngCanvas > .ng-scope").eq(0).click() |
        sleep 1
      end


    end
  end
end
