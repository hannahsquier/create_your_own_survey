class AddSurveyFkToSurveyQuestions < ActiveRecord::Migration
  def change
    add_column :survey_questions, :survey_id, :integer, foreign_key: true
    add_index(:survey_questions, :survey_id)
  end
end
