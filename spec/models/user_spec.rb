describe User, :pending do
  it { should have_one :profile }

  let(:simple_user) { User.create!(email: Faker::Internet.email, password: 'password', password_confirmation: 'password') }
  let(:simple_user_group) { UserGroup.create!(name: Faker::Conference.name) }

  it 'defaults to participant role if role is not specified' do
    simple_user.should have_role :participant
  end

  it 'can create a user with a profile' do
    u = simple_user
    u.create_profile

    u.should be_instance_of User
    u.profile.should be_instance_of Profile

    u.should be_valid
    u.profile.should be_valid
  end

  it 'can create a user who is a participant in a user-group' do
    u = simple_user
    ug = simple_user_group

    u.join_user_group_as_member(ug)

    u.should be_valid
    u.user_groups.should have(1).items
    u.user_groups.should include(ug)

    User.participants.where(id: u.id) do |participants|
      participants.first.should == u
      participants.should have(1).item
    end
    User.builders.should have(0).items
  end

  it 'can create a user who is a builder in a user-group' do
    u = simple_user
    ug = simple_user_group

    u.join_user_group_as_organizer(ug)

    u.should be_valid
    u.user_groups.should have(1).items
    u.user_groups.should include(ug)

    User.builders.where(id: u.id) do |builders|
      builders.first.should == u
      builders.should have(1).item
    end
    User.participants.should have(0).items
  end
end

# == Schema Information
# Schema version: 20140516063750
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null, indexed
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)      indexed
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
