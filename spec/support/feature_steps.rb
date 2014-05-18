# TODO: Only load this for Feature specs
def sign_up_a_new_user_as_a(role)
  visit root_path
  click_link role

  fill_in 'Email', with: Faker::Internet.email
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'password'

  click_button 'Sign up'
end

def sign_out
  destroy_user_session_path
end
