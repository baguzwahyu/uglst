class Venue < ActiveRecord::Base
  #belongs_to :sponsor
  belongs_to :location
  belongs_to :user_group
end
