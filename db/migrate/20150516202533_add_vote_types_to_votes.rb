class AddVoteTypesToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :vote_type, index: true, foreign_key: true
  end
end
