class Group < ApplicationRecord
  has_many  :memberships, dependent: :destroy
  has_many :contacts, through: :memberships, source: :contact
end
