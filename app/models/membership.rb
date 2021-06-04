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
class Membership < ApplicationRecord
  belongs_to :contact
  belongs_to :group

  validates :group_id, presence: true
  validates :contact_id, presence: true
  validates_uniqueness_of :group_id, scope: :contact_id
  validate :only_your_contacts_can_be_part_of_your_groups

  private
  def only_your_contacts_can_be_part_of_your_groups
    if group.user != contact.user
      errors.add(:membership, "Groups and contacts must belong to the same user")
    end  
  end  

end
