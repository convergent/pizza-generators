class <%= user_session_plural_class_name %>Controller < ApplicationController

  before_filter :login_required,  :only   => :destroy
  before_filter :logout_required, :except => :destroy

  def new
    @<%= user_session_singular_name %> = <%= user_session_class_name %>.new
  end

  def create
    @<%= user_session_singular_name %> = <%= user_session_class_name %>.new(params[:<%= user_session_singular_name %>])
    if @<%= user_session_singular_name %>.save
      flash[:notice] = t(:success)
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def destroy
    current_<%= user_session_singular_name %>.destroy
    flash[:notice] = t(:success)
    redirect_to root_url
  end

end
