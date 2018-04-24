class AddDeletedAtColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :deactivated, :bool, default: false
  end
end
