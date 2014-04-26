class AddTitleToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :question_title, :string
  end
end
