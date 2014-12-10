class Test < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  has_many :test_questions
  has_many :answers
  has_many :scores
  validates_presence_of :subject_id, :user_id, :title
end
