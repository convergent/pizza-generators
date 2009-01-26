  update do
    success.flash     { t(:success, :model => <%= class_name %>.human_name) }
    failure.flash_now { t(:failure, :model => <%= class_name %>.human_name) }
  end
