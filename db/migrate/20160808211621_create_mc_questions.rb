class CreateMcQuestions < ActiveRecord::Migration
  def change
    create_table :mc_questions do |t|
      t.references :survey, index: true, foreign_key: true
      t.text :question, null: false
      t.integer :num_options, null: false
      t.boolean :required, null: false

      t.timestamps null: false
    end
  end
end
