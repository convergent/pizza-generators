class <%= user_class_name %> < ActiveRecord::Base
  acts_as_authentic do |c|
      c.session_class = <%= user_session_class_name %>
  end
  
  attr_accessible :login, :email, :password, :password_confirmation, :old_password

  validate_on_update :old_password_entered

  def login=(str)
    write_attribute(:login, str) if new_record?
  end

  private

  def old_password_entered
    
  end
end
