class TaskPage < SitePrism::Page

  include Base_Module
  include Base_Task
  include Create_Task
  include My_Creator_Task
  include My_Receiver_Task

end

