[:participant, :builder, :supporter, :admin].each do |role|
  Role.find_or_create_by(name: role)
end

User.find_or_create_by(email: 'mike@ugtastic.com') do |user|
  user.password = Rails.env.development? ? 'password' : SecureRandom.uuid
  user.add_role :admin
end

if Rails.env.development?
  ug_can = UserGroup.find_or_create_by(name: 'Chicago Alt.NET')
  ug_cdg = UserGroup.find_or_create_by(name: 'Cloud Developer\'s Group')
  ug_rn = UserGroup.find_or_create_by(name: 'Rockford .NET')
  ug_scmc = UserGroup.find_or_create_by(name: 'Software Craftsmanship McHenry County')

  builder = User.find_or_create_by(email: 'builder@example.com') do |user|
    user.password = 'password'
    user.add_role :builder
  end
  builder.join_user_group_as_organizer(ug_scmc)
  builder.join_user_group_as_member(ug_rn)
  builder.join_user_group_as_member(ug_can)

  participant = User.find_or_create_by(email: 'participant@example.com') do |user|
    user.password = 'password'
    user.add_role :participant
  end
  participant.join_user_group_as_member(ug_scmc)
  participant.join_user_group_as_member(ug_can)

  User.find_or_create_by(email: 'supporter@example.com') do |user|
    user.password = 'password'
    user.add_role :supporter
  end
end
