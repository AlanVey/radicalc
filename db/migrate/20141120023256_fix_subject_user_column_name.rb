class FixSubjectUserColumnName < ActiveRecord::Migration
  def change
    rename_column :subjects, :user_id, :author_id
  end
end
