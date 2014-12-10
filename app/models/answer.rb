class Answer < ActiveRecord::Base
  belongs_to :test
  belongs_to :user
  validates_presence_of :user_id, :test_id, :value, :status
  validate :valid_status?

  mount_uploader :value, AnswerUploader


  def display_score(test)
    if get_score(test).nil?
      'These answers have not been marked yet.'
    else
      get_score(test).value
    end
  end

  def get_score(test)
    Score.find_by(test_id: test.id, user_id: self.user.id)
  end


  private
    def valid_status?
      unless ['Submitted', 'Correct', 'Incorrect'].include?(self.status)
        errors.add(:status, 'invalid for the status for test question')
      end
    end

end
