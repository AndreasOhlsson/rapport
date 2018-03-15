class AddIndexToUpdatedAtTickets < ActiveRecord::Migration[5.1]
  def change
    add_index :tickets, :updated_at
  end
end
