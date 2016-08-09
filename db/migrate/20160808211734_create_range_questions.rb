class CreateRangeQuestions < ActiveRecord::Migration
  def change
    create_table :range_questions do |t|
      t.references :survey, index: true, foreign_key: true
      t.text :question, null: false
      t.integer :min, null: false
      t.integer :max, null: false
      t.boolean :required, null: false

      t.timestamps null: false
    end
  end
end
