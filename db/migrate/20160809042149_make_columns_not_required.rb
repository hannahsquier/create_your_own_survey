class MakeColumnsNotRequired < ActiveRecord::Migration
  def change
    change_column_null :mc_options, :option, true

  end
end
