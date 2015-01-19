class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Authority::UserAbilities
  has_many :subjects, foreign_key: :user_id

  has_one :profile
  has_many :questions
  has_many :answers
  has_many :scores

  def get_subscribed_subjects
    Subject.where("id IN (?)", Subscription.where(user_id:self.id, status: 'Subscribed').uniq.pluck(:subject_id))
  end

  def get_invited_subjects
    Subject.where("id IN (?)", Subscription.where(user_id:self.id, status: 'Pending Approval').uniq.pluck(:subject_id))
  end

  def User.getProficiency(user, subject)
    proficiencies = []

    subject.children.each do |child|
      proficiencies << [ child.name, child.calculate_proficiency(user) ]
    end

    if proficiencies.empty?
      proficiencies << [ subject.name, subject.calculate_proficiency(user) ]
    else
      proficiencies
    end
  end
end
