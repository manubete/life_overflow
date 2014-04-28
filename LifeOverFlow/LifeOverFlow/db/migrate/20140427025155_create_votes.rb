class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |col|
      col.string :vote_type
      col.references :voteable, polymorphic: true
      col.timestamps
    end
  end

  def down
    drop_table :votes
  end
end
