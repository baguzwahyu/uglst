[:participant, :builder, :supporter, :admin].each do |role|
  Role.find_or_create_by({ name: role }, without_protection: true)
end

User.find_or_create_by(email: 'mike@ugtastic.com') do |user|
  user.password = Rails.env.development? ? 'password' : SecureRandom.uuid
  user.add_role :admin
end

if Rails.env.development?

  User.find_or_create_by(email: 'builder@example.com') do |user|
    user.password = 'password'
    user.add_role :builder
  end

  User.find_or_create_by(email: 'participant@example.com') do |user|
    user.password = 'password'
    user.add_role :participant
  end

  User.find_or_create_by(email: 'supporter@example.com') do |user|
    user.password = 'password'
    user.add_role :supporter
  end

end
