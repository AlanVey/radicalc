class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
  validates_presence_of :user_id, :test_id
  validates :is_user_admin?

  def is_user_admin?
    user = User.get(:user_id)
    test = Test.get(:test_id)
    subject = Subject.get(test.subject_id)
    user.has_role? :admin, subject
  end
end
