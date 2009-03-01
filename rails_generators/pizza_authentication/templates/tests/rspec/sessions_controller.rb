require File.dirname(__FILE__) + '/../spec_helper'
require 'authlogic/testing/test_unit_helpers' # put this in spec/spec_helper.rb

describe <%= user_session_plural_class_name %>Controller do

  integrate_views

  def new_<%= user_singular_name %>(args = {})
    Factory(:<%= user_singular_name %>, args)
  end

  describe "viewing the login page" do

    context "when not logged in" do

      it "should show the login page" do
        get :new
        response.should render_template(:new)
      end

    end

    context "when logged in" do

      it "should redirect to the home page" do
        set_session_for new_<%= user_singular_name %>
        get :new
        response.should redirect_to(root_url)
      end

    end

  end

  describe "logging in" do

    def login_with args
      post :create, :<%= user_session_singular_name %> => { :login => "bob" }.merge(args)
    end

    before :each do
      @<%= user_singular_name %> = new_<%= user_singular_name %>(:login => "bob", :password => "right")
      <%= user_class_name %>.stub!(:find).and_return(@<%= user_singular_name %>)
    end

    context "with valid credentials" do

      before :each do
        login_with :password => "right"
      end

      it "should set a session for the <%= user_singular_name %>" do
        controller.load_<%= user_session_singular_name %>
        controller.current_<%= user_singular_name %>.should == @<%= user_singular_name %>
      end

      it "should be logged in" do
        controller.load_<%= user_session_singular_name %>
        controller.should be_logged_in
      end

      it "should redirect to the home page" do
        response.should redirect_to(root_url)
      end

    end

    context "with invalid credentials" do

      before :each do
        login_with :password => "wrong"
      end

      it "should not set a session" do
        controller.load_<%= user_session_singular_name %>
        controller.current_<%= user_singular_name %>.should be_nil
      end

      it "should not be logged in" do
        controller.load_<%= user_session_singular_name %>
        controller.should_not be_logged_in
      end      

      it "should show the login page again" do
        response.should render_template(:new)
      end

    end

  end

  describe "logging out" do

    context "when logged in" do

      before :each do
        set_session_for new_<%= user_singular_name %>
        get :destroy
      end

      it "should redirect to the home page" do
        response.should redirect_to(root_url)
      end

      it "should have destroyed the session" do
        controller.load_<%= user_session_singular_name %>
        controller.current_<%= user_session_singular_name %>.should be_nil
      end

      it "should not be logged in" do
        controller.load_<%= user_session_singular_name %>
        controller.should_not be_logged_in
      end      

    end

    context "when not yet logged in" do

      it "should redirect to the login page" do
        get :destroy
        response.should redirect_to(login_url)
      end

    end

  end

end
