require File.dirname(__FILE__) + '/../spec_helper'
require 'authlogic/testing/test_unit_helpers' # put this in spec/spec_helper.rb

describe <%= user_session_plural_class_name %>Controller do
  fixtures :all
  integrate_views

  describe "new action" do

    it "should render new template" do
      get :new
      response.should render_template(:new)
    end

  end

  describe "create action" do

    it "should render new template when authentication is invalid" do
      post :create, :<%= user_session_singular_name %> => { :login => "foo", :password => "wrong" }
      response.should render_template(:new)
      <%= user_session_class_name %>.find.should be_nil
    end

    it "should redirect when authentication is valid" do
      post :create, :<%= user_session_singular_name %> => { :login => "foo", :password => "secret" }
      response.should redirect_to(root_url)
      <%= user_session_class_name %>.find.should_not be_nil
      <%= user_session_class_name %>.find.user.should == <%= user_plural_name %>(:one)
    end

  end

  describe "destroy action" do

    it "should destroy user session" do
      set_session_for <%= user_plural_name %>(:one)
      delete :destroy
      <%= user_session_class_name %>.find.should be_nil
      response.should redirect_to(root_url)
    end

  end

end
