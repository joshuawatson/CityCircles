# == Schema Information
# Schema version: 20100319044343
#
# Table name: blogroll_feeds
#
#  id         :integer(4)      not null, primary key
#  feed_name  :string(255)     not null
#  feed_uri   :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

class BlogrollFeed < ActiveRecord::Base
end
