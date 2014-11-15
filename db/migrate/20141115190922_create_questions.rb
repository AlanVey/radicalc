class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :uri
      t.integer :debate_id
      t.string :kind
      t.integer :subject_id
      t.string :title

      t.timestamps
    end
  end
end
