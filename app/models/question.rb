class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user

  validates_presence_of :user_id, :subject_id, :debate_id, :uri, :kind, :title
  validate :valid_kind?


  private
    def valid_kind?
      unless ['General', 'Technical', 'Test', 'Test Question'].include?(self.kind)
        errors.add(:kind, 'invalid for the type of question')
      end
    end
end
