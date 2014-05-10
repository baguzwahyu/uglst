class UserGroup < ActiveRecord::Base
  has_many :affiliations
  has_many :users, through: :affiliations

  validates :name, presence: true
end

# == Schema Information
# Schema version: 20140506045628
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
