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
class Contact < ApplicationRecord
  
  has_many  :memberships, dependent: :destroy
  belongs_to :user
  has_many :groups, through: :memberships, source: :group
end
