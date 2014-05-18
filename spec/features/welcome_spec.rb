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
        sign_up_a_new_user_as_a 'participant'

        expect(page).to have_content('Welcome! You have signed up successfully.')
      end

      context 'successful registration' do
        before do
          sign_up_a_new_user_as_a 'participant'
        end

        scenario 'enter profile info' do
          fill_in 'Full name', with: Faker::Name.name
          fill_in 'Nickname', with: Faker::Name.first_name

          click_button 'Create Profile'

          expect(page).to have_content('Profile was successfully created')
          expect(page).to have_content('You are currently participating in 0 user-groups.')
        end
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
