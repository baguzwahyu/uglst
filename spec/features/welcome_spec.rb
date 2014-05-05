feature 'Welcome Page' do
  before { destroy_user_session_path }

  context 'when the user is not logged in' do
    scenario 'visitor navigates through to participant signin/signup' do
      visit root_path
      click_link 'participant'

      URI.parse(current_url) do |url|
        url.path.should == '/users/sign_up'
        url.query.should == 'plan=participant'
      end
    end

    scenario 'visitor navigates through to supporter signin/signup' do
      visit root_path
      click_link 'supporter'

      URI.parse(current_url) do |url|
        url.path.should == '/users/sign_up'
        url.query.should == 'plan=supporter'
      end
    end

    scenario 'visitor navigates through to builder signin/signup' do
      visit root_path
      click_link 'builder'

      URI.parse(current_url) do |url|
        url.path.should == '/users/sign_up'
        url.query.should == 'plan=builder'
      end
    end
  end
end
