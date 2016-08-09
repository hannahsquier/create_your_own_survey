class DefaultNumoptionsZero < ActiveRecord::Migration
  def change
    change_column_default :mc_questions, :num_options, 0
  end
end
