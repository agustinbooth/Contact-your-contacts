# == Schema Information
#
# Table name: memberships
#
#  id         :bigint           not null, primary key
#  group_id   :integer
#  contact_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class MembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
