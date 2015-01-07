class AddUserIdAndSubjectIdToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :subject_id, :integer
    add_column :solutions, :user_id, :integer
  end
end
