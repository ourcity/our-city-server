class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :file
      t.string :name
      t.string :title
      t.references :matter_type, index: true, foreign_key: true
      t.references :matter_status, index: true, foreign_key: true
      t.references :body, index: true, foreign_key: true
      t.date :intro_date
      t.date :agenda_date
      t.date :passed_date
      t.date :enactment_date
      t.string :enactment_number
      t.string :requester
      t.text :notes

      t.timestamps null: false
    end
  end
end
