class CreateJoinTableUsersTickets < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :tickets do |t|
      t.integer :user_id, index: true
      t.integer :token, index: true
    end
  end
end
