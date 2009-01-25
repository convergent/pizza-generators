class <%= user_plural_class_name %>Controller < ResourceController::Base

  actions :new, :create

  create do
    success do
      flash { t(:success) }
      wants.html { redirect_to root_url }
    end
    failure.flash_now { t(:failure) }
  end

end
