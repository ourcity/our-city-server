class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.references :body, index: true, foreign_key: true
      t.string :name
      t.string :comm_type
      t.string :info_url
      t.string :code

      t.timestamps null: false
    end
  end
end
