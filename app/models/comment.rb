class Comment < ActiveRecord::Base
  belongs_to :ticket, :foreign_key => :token, :primary_key => :token
  default_scope -> { order(created_at: :asc)}
  validates :token, presence: true
end
