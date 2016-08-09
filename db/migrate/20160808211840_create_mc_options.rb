class CreateMcOptions < ActiveRecord::Migration
  def change
    create_table :mc_options do |t|
      t.string :option, null: false
      t.references :mc_question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
