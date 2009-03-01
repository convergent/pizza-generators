require File.dirname(__FILE__) + '/../spec_helper'

describe <%= user_plural_class_name %>Controller do

  integrate_views

  describe "new action" do

    it "should render new template" do
      get :new
      response.should render_template(:new)
    end

  end

  describe "create action" do

    it "should render new template when model is invalid" do
      <%= user_class_name %>.any_instance.stubs(:valid?).returns(false)
      post :create
      response.should render_template(:new)
    end

    it "should redirect when model is valid" do
      <%= user_class_name %>.any_instance.stubs(:valid?).returns(true)
      <%= user_class_name %>.stubs(:new).returns(<%= user_plural_name %>(:one))
      post :create
      response.should redirect_to(root_url)
    end

  end

end
