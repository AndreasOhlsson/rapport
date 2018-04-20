class Ticket < ApplicationRecord
  acts_as_readable on: :updated_at
  uniquify :token, :length => 12, :chars => 0..9
  has_many :comments, dependent: :destroy, :foreign_key => :token, :primary_key => :token
  validates :title, presence: true
  validates :dateOfEvent, presence: true
  validates :message, presence: true
  validates :role, presence: true
  has_and_belongs_to_many :users

  enum role: [ :Quratelet, :Seniors, :both ]
  #validate :has_content
  #validates_presence_of :senior, :unless => :quratel? 
  #validates_presence_of :quratel, :unless => :senior?
  #validates :senior, presence: { if: -> { :quratel.nil? } }
  #validates :quratel, presence: { if: -> { :senior.nil? } }
end

def has_content
  if self.quratel.nil? && self.senior.nil?
    
  end
end
