# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  group_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
require "test_helper"

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
