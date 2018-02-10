class Ticket < ApplicationRecord
  uniquify :token, :length => 12, :chars => 0..9

  validates :title, presence: true
  validates :dateOfEvent, presence: true
  validates :message, presence: true
end
