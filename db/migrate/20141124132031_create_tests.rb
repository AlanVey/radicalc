class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :subject_id
      t.integer :user_id
      t.string :title
      t.string :kind

      t.timestamps
    end
  end
end
