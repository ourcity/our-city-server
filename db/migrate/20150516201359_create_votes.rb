class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :person, index: true, foreign_key: true
      t.string :value_name
      t.integer :sort
      t.integer :result
      t.references :event_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
