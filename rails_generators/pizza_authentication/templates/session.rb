class <%= user_session_class_name %> < Authlogic::Session::Base
  extend ActsAsTranslatableModel
  authenticate_with <%= user_class_name %>
end
