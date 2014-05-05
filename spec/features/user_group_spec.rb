feature 'User-Groups' do
  before { destroy_user_session_path }

  scenario 'when there are no user-groups to list' do
    visit user_groups_path

    expect(page).to have_content('No User-Groups to show.')
  end
end

