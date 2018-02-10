class AddUniqueIdsToTicket < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :generatedId

    add_column :tickets, :token, :string
    add_index :tickets, :token, unique: true
  end
end
