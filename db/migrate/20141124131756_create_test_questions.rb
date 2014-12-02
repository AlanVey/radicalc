class CreateTestQuestions < ActiveRecord::Migration
  def change
    create_table :test_questions do |t|
      t.string :title
      t.string :kind
      t.integer :user_id
      t.text :answer
      t.integer :test_id
      t.string :status

      t.timestamps
    end
  end
end
