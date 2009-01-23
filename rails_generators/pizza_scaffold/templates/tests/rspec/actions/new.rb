  describe "new action" do

    it "should render new template" do
      get :new
      response.should render_template(:new)
    end

  end
