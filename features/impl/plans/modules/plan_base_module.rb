module Base_Plan
  def self.included(base)
    base.class_eval do

      set_url "#{BASE_URL}/plan/index.htm"
      element :create_nav, '.nav-sidebar li.create a'
      elements :my_creator_ng_grid_rows, '.ngViewport .ngCanvas > .ng-scope'
    end
  end
end
