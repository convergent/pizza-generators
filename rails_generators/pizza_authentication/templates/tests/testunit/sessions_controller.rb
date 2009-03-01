require 'test_helper'
require 'authlogic/testing/test_unit_helpers' # put this in test/test_helper.rb

class <%= user_session_plural_class_name %>ControllerTest < ActionController::TestCase

  def setup
    @<%= user_singular_name %> = Factory(:<%= user_singular_name %>, :login => "bob", :password => "right")
  end

  test "new action should render new template" do
    get :new
    assert_template 'new'
  end

  test "create action should create user session when succesful login" do
    post :create, :<%= user_session_singular_name %> => { :login => "bob", :password => "right" }
    assert <%= user_session_singular_name %> = <%= user_session_class_name %>.find
    assert_equal @<%= user_singular_name %>, <%= user_session_singular_name %>.<%= user_singular_name %>
    assert_redirected_to root_url
  end

  test "create action should render new template when failed login" do
    post :create, :<%= user_session_singular_name %> => { :login => "bob", :password => "wrong" }
    assert_template 'new'
    assert_nil <%= user_session_class_name %>.find
  end

  test "destroy action should destroy user session" do
    set_session_for <%= user_plural_name %>(:foo)
    assert <%= user_session_class_name %>.find 
    delete :destroy
    assert_nil <%= user_session_class_name %>.find
    assert_redirected_to login_url
  end

end
