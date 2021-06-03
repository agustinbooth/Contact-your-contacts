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
class Group < ApplicationRecord
  has_many  :memberships, dependent: :destroy
  has_many :contacts, through: :memberships, source: :contact
  has_many :users, through: :contacts, source: :user
  belongs_to :user
end
