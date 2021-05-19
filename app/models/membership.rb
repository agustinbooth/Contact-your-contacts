class Membership < ApplicationRecord
  belongs_to :contact
  belongs_to :group

  validates :group_id, presence: true
  validates :contact_id, presence: true
  validates_uniqueness_of :group_id, scope: :contact_id

end
