class Subject < ActiveRecord::Base
  validates_presence_of :name, :body, :user_id
  belongs_to :user
end