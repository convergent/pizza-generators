class <%= user_plural_class_name %>Controller < ApplicationController

  before_filter :logout_required, :only => [ :new, :create ]
  before_filter :login_required,  :only => [ :show, :edit, :update ]

  def new
    @<%= user_singular_name %> = <%= user_class_name %>.new
  end

  def create
    @<%= user_singular_name %> = <%= user_class_name %>.new(params[:<%= user_singular_name %>])
    if @<%= user_singular_name %>.save
      flash[:notice] = t(:success)
      redirect_to <%= user_singular_name %>_url
    else
      render :action => 'new'
    end
  end

  def show
    @<%= user_singular_name %> = current_<%= user_singular_name %>
  end

  def edit
    @<%= user_singular_name %> = current_<%= user_singular_name %>
  end

  def update
    @<%= user_singular_name %> = current_<%= user_singular_name %>
    if @<%= user_singular_name %>.update_attributes(params[:<%= user_singular_name %>])
      flash[:notice] = t(:success)
      redirect_to <%= user_singular_name %>_url
    else
      render :action => 'new'
    end
  end

end
