class CreateRollCalls < ActiveRecord::Migration
  def change
    create_table :roll_calls do |t|
      t.references :person, index: true, foreign_key: true
      t.string :value_name
      t.integer :call_sort
      t.integer :result
      t.references :event_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
