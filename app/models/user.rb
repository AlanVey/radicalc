class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :profile
  has_many :subjects
  has_many :questions
  has_many :answers

  def get_subscribed_subjects
    Subject.where("id IN (?)", Subscription.where(user_id:self.id, status: 'Subscribed').uniq.pluck(:subject_id))
  end

  def get_invited_subjects
    Subject.where("id IN (?)", Subscription.where(user_id:self.id, status: 'Pending Approval').uniq.pluck(:subject_id))
  end
end
