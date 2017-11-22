class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.integer :seats
      t.datetime :date_time
      t.integer :status, default: 0
      t.string :remarks
      t.references :table, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
