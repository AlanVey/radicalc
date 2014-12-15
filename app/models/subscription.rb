class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  validates_presence_of :user_id, :subject_id, :status
  validates_presence_of :privilege #can be admin or member
end
