class Group < ApplicationRecord
  has_many  :memberships, dependent: :destroy
  has_many :contacts, through: :memberships, source: :contact
  has_many :users, through: :contacts, source: :user
  belongs_to :user
end
