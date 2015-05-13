class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :body, index: true, foreign_key: true
      t.date :date
      t.string :time
      t.string :agenda_status
      t.string :minute_status
      t.string :location

      t.timestamps null: false
    end
  end
end
