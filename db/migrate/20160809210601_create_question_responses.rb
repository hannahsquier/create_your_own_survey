class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
      t.references :survey_response, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.integer :answer

      t.timestamps null: false
    end
  end
end
