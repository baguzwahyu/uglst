class Location < ActiveRecord::Base
  has_many :venues
  has_many :user_groups, through: :venues
  #has_many :sponsors, through: :venues
end
