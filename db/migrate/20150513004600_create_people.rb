class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.boolean :active_flag
      t.boolean :used_sponsor_flag

      t.timestamps null: false
    end
  end
end
