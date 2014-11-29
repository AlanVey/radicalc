class Answer < ActiveRecord::Base
  belongs_to :test
  belongs_to :user
  validates_presence_of :user_id, :test_id, :value, :status
  validate :valid_status?

  mount_uploader :value, AnswerUploader


  private
    def valid_status?
      unless ['Submitted', 'Correct', 'Incorrect'].include?(self.status)
        errors.add(:status, 'invalid for the status for test question')
      end
    end
end
