class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |col|
      col.belongs_to :question
      col.string :comment_content
      col.references :commentable, polymorphic: true
      col.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
