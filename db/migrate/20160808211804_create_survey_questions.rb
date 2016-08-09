class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.string :question_type
      t.integer :question_id
      t.timestamps null: false
    end

    add_index :survey_questions, [:question_type, :question_id]
  end
end
