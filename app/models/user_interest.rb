# == Schema Information
# Schema version: 20091026161410
#
# Table name: user_interests
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)      not null
#  interest_id :integer(4)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

class UserInterest < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :interest
  
end