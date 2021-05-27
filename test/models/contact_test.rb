# == Schema Information
#
# Table name: contacts
#
#  id                    :bigint           not null, primary key
#  name                  :string
#  last_name             :string
#  phone_number          :string
#  communication_channel :string
#  user_id               :integer
#  email                 :string
#  organization          :string
#  facebook              :string
#  instagram             :string
#  twitter               :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
require "test_helper"

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
