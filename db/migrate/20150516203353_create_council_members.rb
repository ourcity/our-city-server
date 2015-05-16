class CreateCouncilMembers < ActiveRecord::Migration
  def change
    create_table :council_members do |t|
      t.string :ward
      t.string :first_name
      t.string :last_name
      t.string :ward_url
      t.string :image_url
      t.string :email
      t.string :phone
      t.string :neighborhoods
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
