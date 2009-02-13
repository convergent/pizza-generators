# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.
# 
#   <%% if logged_in? %>
#     Welcome <%%= current_<%= user_singular_name %>.login %>! Not you?
#     <%%= link_to "Log out", logout_path %>
#   <%% else %>
#     <%%= link_to "Sign up", signup_path %> or
#     <%%= link_to "log in", login_path %>.
#   <%% end %>
# 
# You can also restrict unregistered users from accessing a controller using
# a before filter. For example.
# 
#   before_filter :login_required, :except => [:index, :show]
module Authentication

  def self.included(controller)
    controller.send :helper_method, :current_<%= user_singular_name %>, :logged_in?, :current_<%= user_session_singular_name %>
  end

  def load_<%= user_session_singular_name %>
    @<%= user_session_singular_name %> = <%= user_session_class_name %>.find
    @current_<%= user_singular_name %> = @<%= user_session_singular_name %> && @<%= user_session_singular_name %>.user
  end

  def <%= user_session_singular_name %>
    @<%= user_session_singular_name %>
  end
  
  def current_<%= user_singular_name %>
    @current_<%= user_singular_name %>
  end

  def logged_in?
    current_<%= user_singular_name %>
  end
  
  def login_required
    unless logged_in?
      flash[:error] = I18n.t("<%= user_session_plural_name %>.login_required")
      redirect_to login_url
    end
  end

  def logout_required
    if logged_in?
      flash[:error] = I18n.t("<%= user_session_plural_name %>.logout_required")
      redirect_to(request.referrer || root_url)
    end
  end

end
