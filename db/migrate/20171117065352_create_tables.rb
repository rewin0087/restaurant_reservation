class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :chairs

      t.timestamps null: false
    end
  end
end
