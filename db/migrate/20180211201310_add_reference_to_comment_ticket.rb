class AddReferenceToCommentTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :token, :string
    add_foreign_key :comments, :tickets, column: :token, primary_key: "token"
  end
end
