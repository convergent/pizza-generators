  describe "edit action" do

    it "should render edit template" do
      get :edit, :id => <%= class_name %>.first
      response.should render_template(:edit)
    end

  end
