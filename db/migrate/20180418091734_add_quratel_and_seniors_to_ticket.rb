class AddQuratelAndSeniorsToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :role, :integer
  end
end
