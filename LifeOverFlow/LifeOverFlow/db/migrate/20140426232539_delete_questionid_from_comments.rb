class DeleteQuestionidFromComments < ActiveRecord::Migration
  def up
    remove_column(:comments, :question_id)
  end

  def down
  end
end
