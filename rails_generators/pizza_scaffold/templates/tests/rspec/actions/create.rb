  describe "create action" do

    it "should render new template when model is invalid" do
      <%= class_name %>.any_instance.stubs(:valid?).returns(false)
      post :create
      response.should render_template(:new)
    end
    
    it "should redirect when model is valid" do
      <%= class_name %>.any_instance.stubs(:valid?).returns(true)
      post :create
      response.should redirect_to(<%= item_path_for_spec('url') %>)
    end

  end
