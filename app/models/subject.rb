class Subject < ActiveRecord::Base
  validates_presence_of :name, :body, :user_id
  belongs_to :user
  acts_as_tree order: 'created_at DESC'
end