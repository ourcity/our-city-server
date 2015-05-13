class CreateBodies < ActiveRecord::Migration
  def change
    create_table :bodies do |t|
      t.string :name
      t.references :body_type, index: true, foreign_key: true
      t.boolean :meet_flag
      t.boolean :active_flag
      t.text :description
      t.references :person, index: true, foreign_key: true
      t.string :person_name
      t.integer :number_of_members

      t.timestamps null: false
    end
  end
end
