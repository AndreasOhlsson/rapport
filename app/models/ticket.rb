class Ticket < ApplicationRecord
  uniquify :token, :length => 12, :chars => 0..9
  has_many :comments, :foreign_key => :token, :primary_key => :token
  validates :title, presence: true
  validates :dateOfEvent, presence: true
  validates :message, presence: true
  has_and_belongs_to_many :users
end
