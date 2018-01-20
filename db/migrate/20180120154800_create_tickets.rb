class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.datetime :dateOfEvent
      t.string :message
      t.string :generatedId

      t.timestamps
    end
  end
end
