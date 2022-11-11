class Activity < ApplicationRecord
  belongs_to :admin_user
  belongs_to :phase

  validates :actividad, presence: true
  validates :pfecha, presence: true


end
