class <%= user_session_plural_class_name %>Controller < ResourceController::Singleton

  before_filter :login_required,  :only => [ :destroy ]
  before_filter :logout_required, :except => [ :destroy ]

  actions :new, :create, :destroy

  create do
    success do
      wants.html { redirect_to root_url }
      flash { t(:success) }
    end
    failure.flash_now { t(:failure) }
  end

  destroy.success do
    flash { t(:success) }
    wants.html { redirect_to root_url }
  end

  private

  def object
    @object ||= <%= user_session_class_name %>.find
  end

end
