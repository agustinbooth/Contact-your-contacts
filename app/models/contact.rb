class Contact < ApplicationRecord
  
  has_many  :memberships, dependent: :destroy
  belongs_to :user
  has_many :groups, through: :memberships, source: :group
end
