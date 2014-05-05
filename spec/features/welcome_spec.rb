feature 'Starting at the Welcome Page' do
  before {
    destroy_user_session_path

    Role.find_or_create_by(name: 'participant')
    Role.find_or_create_by(name: 'builder')
    Role.find_or_create_by(name: 'supporter')
  }

  context 'when the visitor is not logged in' do
    context 'and navigates to participant' do
      scenario 'chooses to signup' do
        visit root_path
        click_link 'participant'

        URI.parse(current_url) do |url|
          url.path.should == '/users/sign_up'
          url.query.should == 'plan=participant'
        end

        expect(page).to have_css('a.list-group-item.participant-plan-description.active')
        expect(find(:css, 'select#user_roles').value).to eq(Role.find_by_name('participant').id.to_s)
      end

      scenario 'sign up' do
        visit root_path
        click_link 'participant'

        fill_in 'Email', with: 'participant@example.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'

        click_button 'Sign up'

        expect(page).to have_content('Welcome! You have signed up successfully.')
      end
    end

    context 'and navigates to builder' do
      scenario 'chooses to signup' do
        visit root_path
        click_link 'builder'

        URI.parse(current_url) do |url|
          url.path.should == '/users/sign_up'
          url.query.should == 'plan=builder'
        end

        expect(page).to have_css('a.list-group-item.builder-plan-description.active')
        expect(find(:css, 'select#user_roles').value).to eq(Role.find_by_name('builder').id.to_s)
      end
    end

    context 'and navigates to supporter' do
      scenario 'chooses to signup' do
        visit root_path
        click_link 'supporter'

        URI.parse(current_url) do |url|
          url.path.should == '/users/sign_up'
          url.query.should == 'plan=supporter'
        end

        expect(page).to have_css('a.list-group-item.supporter-plan-description.active')
        expect(find(:css, 'select#user_roles').value).to eq(Role.find_by_name('supporter').id.to_s)
      end
    end
  end
end
