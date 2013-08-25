module My_Creator_Task
  def self.included(base)
    base.class_eval do

      element :my_creator_content, '.initiationsList'
      elements :my_creator_ng_grid_rows, '.ngViewport .ngCanvas > .ng-scope'

      def link_to_my_creator_page
        self.my_creator_nav.click
      end

    end
  end
end