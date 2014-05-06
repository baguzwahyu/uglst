module ControllerMacros
  def login_as(user, role = :user)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[role]
      sign_in user
    end
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
end
