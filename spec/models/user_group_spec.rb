describe UserGroup do
  it { should validate_presence_of :name }
  it 'can accept nested attributes for venues' do
    user_group = UserGroup.create!(
      name: Faker::Conference.name,
      homepage: Faker::Internet.http_url,
      venues: [
        Venue.new(
          location: Location.new(
            name: Faker::Company.name,
            full_street_address: Faker::AddressAU.full_address
          )
        )
      ])

    user_group.should_not be_new_record
    user_group.venues.should have(1).item
    user_group.locations.should have(1).item
    user_group.locations.first.should == user_group.venues.first.location
  end
end

# == Schema Information
# Schema version: 20140516063750
#
# Table name: user_groups
#
#  id          :integer          not null, primary key
#  name        :string(255)      indexed
#  description :text
#  homepage    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_user_groups_on_name  (name) UNIQUE
#
