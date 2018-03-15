class Comment < ActiveRecord::Base
  belongs_to :ticket, :foreign_key => :token, :primary_key => :token
  belongs_to :user
  default_scope -> { order(created_at: :asc)}
  validates :token, presence: true
end
