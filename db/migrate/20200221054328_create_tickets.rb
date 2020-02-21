class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :user_id
      t.string :event_id
      t.float :price

      t.timestamps
    end
  end
end
