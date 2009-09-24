# == Schema Information
# Schema version: 20090921083414
#
# Table name: user_profiles
#
#  id         :integer(4)      not null, primary key
#  first_name :string(255)     not null
#  last_name  :string(255)     not null
#  about_me   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class UserProfile < ActiveRecord::Base

  belongs_to :user

end
