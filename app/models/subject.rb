class Subject < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :body
  validates_presence_of :user_id
  belongs_to :user
end