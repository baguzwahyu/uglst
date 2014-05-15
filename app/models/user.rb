class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_one :profile, autosave: true, dependent: :destroy, inverse_of: :user

  has_many :affiliations
  has_many :user_groups, through: :affiliations

  after_create :assign_default_role

  scope :participants, ->{ joins(:affiliations).where(affiliations: { role: :participant }) }
  scope :builders, ->{ joins(:affiliations).where(affiliations: { role: :builder }) }

  #extend FriendlyId

  def assign_default_role
    add_role(:participant) if self.roles.blank?
  end

  def join_user_group_as_organizer(user_group)
    affiliations.create(role: :organizer, user_group: user_group)
  end

  def join_user_group_as_member(user_group)
    affiliations.create(role: :member, user_group: user_group)
  end
end

# == Schema Information
# Schema version: 20140515151603
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
