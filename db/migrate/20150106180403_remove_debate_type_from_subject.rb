class RemoveDebateTypeFromSubject < ActiveRecord::Migration
  def change
    remove_column :subjects, :debate_type
  end
end
