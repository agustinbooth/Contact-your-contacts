class Membership < ApplicationRecord
  belongs_to :contact
  belongs_to :group
end
