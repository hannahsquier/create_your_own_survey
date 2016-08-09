class ChangeColQuestionToQuestionType < ActiveRecord::Migration
  def change
    rename_column :mc_questions, :question, :question_text
    rename_column :range_questions, :question, :question_text
  end
end
