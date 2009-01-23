  destroy do
    success.flash I18n.t("<%= plural_name %>.destroy.success", :model => <%= class_name %>.human_name)
    failure.flash I18n.t("<%= plural_name %>.destroy.failure", :model => <%= class_name %>.human_name)
  end
