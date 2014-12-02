class TestQuestion < ActiveRecord::Base
  belongs_to :test
  belongs_to :user
  validates_presence_of :title, :kind, :answer, :user_id, :test_id, :status
end
