class ChangeTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :subjects, :type, :debateType
  end
end
