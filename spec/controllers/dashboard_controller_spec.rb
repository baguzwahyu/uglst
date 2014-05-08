describe DashboardController do
  describe "GET 'show'" do
    context 'user is not logged in' do
      it '/dashboard/:id' do
        u = User.create!(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
        get 'show', user: u
        response.should be_success
      end

      it '/dashboard' do
        u = User.create!(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
        get 'show'
        response.should be_success
      end
    end
  end
end
