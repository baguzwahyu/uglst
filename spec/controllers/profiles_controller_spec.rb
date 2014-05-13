#describe ProfilesController do

  #let(:valid_attributes) { {  } }
  #let(:valid_session) { {} }

  #describe "GET show" do
    #it "assigns the requested profile as @profile" do
      #profile = Profile.create! valid_attributes
      #get :show, {:id => profile.to_param}, valid_session
      #assigns(:profile).should eq(profile)
    #end
  #end

  #describe "GET new" do
    #it "assigns a new profile as @profile" do
      #get :new, {}, valid_session
      #assigns(:profile).should be_a_new(Profile)
    #end
  #end

  #describe "GET edit" do
    #it "assigns the requested profile as @profile" do
      #profile = Profile.create! valid_attributes
      #get :edit, {:id => profile.to_param}, valid_session
      #assigns(:profile).should eq(profile)
    #end
  #end

  #describe "POST create" do
    #describe "with valid params" do
      #it "creates a new Profile" do
        #expect {
          #post :create, {:profile => valid_attributes}, valid_session
        #}.to change(Profile, :count).by(1)
      #end

      #it "assigns a newly created profile as @profile" do
        #post :create, {:profile => valid_attributes}, valid_session
        #assigns(:profile).should be_a(Profile)
        #assigns(:profile).should be_persisted
      #end

      #it "redirects to the created profile" do
        #post :create, {:profile => valid_attributes}, valid_session
        #response.should redirect_to(Profile.last)
      #end
    #end

    #describe "with invalid params" do
      #it "assigns a newly created but unsaved profile as @profile" do
        #Profile.any_instance.stub(:save).and_return(false)
        #post :create, {:profile => {  }}, valid_session
        #assigns(:profile).should be_a_new(Profile)
      #end

      #it "re-renders the 'new' template" do
        #Profile.any_instance.stub(:save).and_return(false)
        #post :create, {:profile => {  }}, valid_session
        #response.should render_template("new")
      #end
    #end
  #end

  #describe "PUT update" do
    #describe "with valid params" do
      #it "updates the requested profile" do
        #profile = Profile.create! valid_attributes
        #Profile.any_instance.should_receive(:update).with({ "these" => "params" })
        #put :update, {:id => profile.to_param, :profile => { "these" => "params" }}, valid_session
      #end

      #it "assigns the requested profile as @profile" do
        #profile = Profile.create! valid_attributes
        #put :update, {:id => profile.to_param, :profile => valid_attributes}, valid_session
        #assigns(:profile).should eq(profile)
      #end

      #it "redirects to the profile" do
        #profile = Profile.create! valid_attributes
        #put :update, {:id => profile.to_param, :profile => valid_attributes}, valid_session
        #response.should redirect_to(profile)
      #end
    #end

    #describe "with invalid params" do
      #it "assigns the profile as @profile" do
        #profile = Profile.create! valid_attributes
        #Profile.any_instance.stub(:save).and_return(false)
        #put :update, {:id => profile.to_param, :profile => {  }}, valid_session
        #assigns(:profile).should eq(profile)
      #end

      #it "re-renders the 'edit' template" do
        #profile = Profile.create! valid_attributes
        #Profile.any_instance.stub(:save).and_return(false)
        #put :update, {:id => profile.to_param, :profile => {  }}, valid_session
        #response.should render_template("edit")
      #end
    #end
  #end

  #describe "DELETE destroy" do
    #it "destroys the requested profile" do
      #profile = Profile.create! valid_attributes
      #expect {
        #delete :destroy, {:id => profile.to_param}, valid_session
      #}.to change(Profile, :count).by(-1)
    #end

    #it "redirects to the profiles list" do
      #profile = Profile.create! valid_attributes
      #delete :destroy, {:id => profile.to_param}, valid_session
      #response.should redirect_to(profile_url)
    #end
  #end

#end
