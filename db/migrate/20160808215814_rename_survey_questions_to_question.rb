class RenameSurveyQuestionsToQuestion < ActiveRecord::Migration
  def change
    rename_table :survey_questions, :questions
  end
end
