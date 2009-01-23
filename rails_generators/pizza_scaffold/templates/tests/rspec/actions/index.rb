  describe "index action" do

    it "should render index template" do
      get :index
      response.should render_template(:index)
    end

  end
