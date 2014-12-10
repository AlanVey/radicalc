class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  validates_presence_of :user_id, :subject_id, :status
end
