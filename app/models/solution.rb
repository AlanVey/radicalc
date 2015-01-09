class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
  validates_presence_of :user_id, :test_id
  validate :is_user_admin?

  mount_uploader :value, SolutionUploader

  def is_user_admin?
    user = User.find_by(id: self.user_id)
    test = Test.find_by(id: self.test_id)
    subject = Subject.find_by(id: test.subject_id)
    user.has_role? :admin, subject
  end
end