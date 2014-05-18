class Sponsor < ActiveRecord::Base
  #has_many :venues
  #has_many :locations, through: :venues
end

# == Schema Information
# Schema version: 20140516063750
#
# Table name: sponsors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
