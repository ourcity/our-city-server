class CreateEventItems < ActiveRecord::Migration
  def change
    create_table :event_items do |t|
      t.references :event, index: true, foreign_key: true
      t.integer :agenda_sequence
      t.integer :minutes_sequence
      t.text :agenda_note
      t.text :minutes_note

      t.timestamps null: false
    end
  end
end
