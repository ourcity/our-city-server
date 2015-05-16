class CreateCommitteeMembers < ActiveRecord::Migration
  def change
    create_table :committee_members do |t|
      t.references :committee, index: true, foreign_key: true
      t.references :council_member, index: true, foreign_key: true
      t.boolean :chair
      t.boolean :vice_chair

      t.timestamps null: false
    end
  end
end
