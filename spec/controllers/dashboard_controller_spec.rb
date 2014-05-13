#describe DashboardController do
  #describe "GET 'show'" do
    #let (:user) {
      #u = User.create!(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
      #u.add_role(:participant)
      #u
    #}

    #context 'not signed in' do
      #it 'can show another user profile' do
        #get 'show', id: user
        #expect(assigns(:context)).to eq(:show_other_public_profile)
        #response.should be_successful
        #expect(subject).to render_template('dashboard/public')
      #end

      #it 'will prompt me to sign up if I did not specify a profile id' do
        #get 'show'
        #expect(assigns(:context)).to eq(:require_signin)
        #flash[:notice].should eq('Sign up to create your own dashboard.')
        #subject.should redirect_to(new_user_session_path)
      #end
    #end

    #context 'signed in as a participant' do
      #before do
        #@request.env['devise.mapping'] = Devise.mappings[:user]
        #sign_in user
      #end

      #it 'will show me another user\'s public dashboard' do
        #u2 = User.create!(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
        #u2.add_role(:participant)

        #get 'show', id: u2
        #response.should be_successful
        #expect(assigns(:context)).to eq(:show_other_public_profile)
        #expect(subject).to render_template('dashboard/public')
      #end

      #it 'will implicitly show me my own dashboard' do
        #get 'show'
        #response.should be_successful
        #expect(assigns(:context)).to eq(:show_own_profile)
        #expect(subject).to render_template('dashboard/private')
      #end

      #it 'will explicitly show me my own dashboard' do
        #get 'show', id: user.id
        #response.should be_success
        #expect(assigns(:context)).to eq(:show_own_profile)
        #expect(subject).to render_template('dashboard/private')
      #end
    #end
  #end
#end
