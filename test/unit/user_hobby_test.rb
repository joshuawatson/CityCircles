# == Schema Information
#
# Table name: user_hobbies
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)      not null
#  hobby_id   :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class UserHobbyTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
