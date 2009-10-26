# == Schema Information
# Schema version: 20091012063947
#
# Table name: user_details
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)      not null
#  first_name :string(255)
#  last_name  :string(255)
#  about_me   :string(255)
#  hobbies    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class UserDetail < ActiveRecord::Base

  belongs_to :user
  has_attached_file :avatar, :styles => { :small => "50x50>", :medium => "100x100>", :large => "150x150>", :huge => "300x300>" }, :path => ":rails_root/public/user_details/avatars/:id/:style_:basename.:extension", :url => "/user_details/avatars/:id/:style_:basename.:extension"
end
