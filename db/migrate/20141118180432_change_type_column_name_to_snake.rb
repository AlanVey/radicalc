class ChangeTypeColumnNameToSnake < ActiveRecord::Migration
  def change
    rename_column :subjects, :debateType, :debate_type
  end
end
