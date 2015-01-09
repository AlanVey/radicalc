class ChangeSubjectIdToTestIdInSolution < ActiveRecord::Migration
  def change
    rename_column :solutions, :subject_id, :test_id
  end
end
