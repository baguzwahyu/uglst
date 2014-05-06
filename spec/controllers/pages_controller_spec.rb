describe PagesController do

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'privacy_policy'" do
    it "returns http success" do
      get 'privacy_policy'
      response.should be_success
    end
  end

  describe "GET 'terms_of_service'" do
    it "returns http success" do
      get 'terms_of_service'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end
end
