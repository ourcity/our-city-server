class CreateMatterTypes < ActiveRecord::Migration
  def change
    create_table :matter_types do |t|
      t.string :name
      t.integer :sort
      t.boolean :active_flag
      t.text :description
      t.boolean :used_flag

      t.timestamps null: false
    end
  end
end
