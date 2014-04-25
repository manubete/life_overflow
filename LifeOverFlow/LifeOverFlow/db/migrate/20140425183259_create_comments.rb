class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |col|
      col.text :comment_content
      col.references :commentable, polymorphic: true
    end
  end

  def down
    drop_table :comments
  end
end
