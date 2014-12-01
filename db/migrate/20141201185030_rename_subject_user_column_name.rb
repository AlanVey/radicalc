class RenameSubjectUserColumnName < ActiveRecord::Migration
  def change
    rename_column :subjects, :author_id, :user_id
  end
end
