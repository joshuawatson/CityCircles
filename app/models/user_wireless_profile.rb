# == Schema Information
# Schema version: 20090921083414
#
# Table name: user_wireless_profiles
#
#  id               :integer(4)      not null, primary key
#  wireless_carrier :string(255)
#  wireless_number  :string(255)
#  subscriptions    :string(255)
#  digest           :boolean(1)      default(TRUE)
#  created_at       :datetime
#  updated_at       :datetime
#

class UserWirelessProfile < ActiveRecord::Base
end
