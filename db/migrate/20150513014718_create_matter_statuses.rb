class CreateMatterStatuses < ActiveRecord::Migration
  def change
    create_table :matter_statuses do |t|
      t.string :name
      t.boolean :active_flag
      t.string :description
      t.boolean :used_flag

      t.timestamps null: false
    end
  end
end
