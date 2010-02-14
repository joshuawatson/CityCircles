# == Schema Information
# Schema version: 20100207115214
#
# Table name: organization_members
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)      not null
#  organization_id :integer(4)      not null
#  is_active       :boolean(1)      default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#

class OrganizationMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
end
