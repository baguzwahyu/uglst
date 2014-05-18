class UserGroup < ActiveRecord::Base
  #has_many :affiliations
  #has_many :users, through: :affiliations

  has_many :venues, inverse_of: :user_group
  has_many :locations, through: :venues

  validates :name, presence: true
  validates :homepage, presence: true

  accepts_nested_attributes_for :venues
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
