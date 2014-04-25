class CreateAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |col|
      col.string :answer_content
      col.belongs_to :question

    end
  end

  def down
    drop_table :answers
  end
end
