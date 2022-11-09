class Activity < ApplicationRecord
  belongs_to :admin_user
  belongs_to :phase
end
