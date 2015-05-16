class CreateVoteTypes < ActiveRecord::Migration
  def change
    create_table :vote_types do |t|
      t.string :name
      t.integer :used_for
      t.integer :result
      t.integer :sort

      t.timestamps null: false
    end
  end
end
