class TaskPage < SitePrism::Page

  set_url "http://localhost:8080/pmp/pages/task/index.htm"
  element :create_nav, '.nav-sidebar li.create'
  element :section_content, 'section.content'

  #def create_nav_click
  #   self.create_nav.click
  #end

end
