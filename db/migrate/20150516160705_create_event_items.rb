class CreateEventItems < ActiveRecord::Migration
  def change
    create_table :event_items do |t|
      t.references :event, index: true, foreign_key: true
      t.references :action, index: true, foreign_key: true
      t.references :matter, index: true, foreign_key: true
      t.integer :agenda_sequence
      t.integer :minutes_sequence
      t.text :agenda_note
      t.text :minutes_note
      t.text :action_name
      t.boolean :passed_flag
      t.string :passed_flag_name
      t.boolean :roll_call_flag
      t.string :title
      t.string :tally
      t.integer :consent
      t.integer :mover_id
      t.integer :seconder_id
      t.text :matter_type
      t.text :matter_status

      t.timestamps null: false
    end
  end
end
