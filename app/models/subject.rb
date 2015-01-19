class Subject < ActiveRecord::Base
  validates_presence_of :name, :body, :user_id
  mount_uploader :icon, SubjectPicUploader

  resourcify
  include Authority::Abilities
  belongs_to :user
  has_many :questions
  has_many :tests
  acts_as_tree

  def get_ancestors
    [ self ] + self.ancestors
  end

  def get_subscribed_users
    User.where("id IN (?)", Subscription.where(subject_id:self.id, status: 'Subscribed').uniq.pluck(:user_id))
  end

  def get_invited_users
    User.where("id IN (?)", Subscription.where(subject_id:self.id, status: 'Pending Approval').uniq.pluck(:user_id))
  end

  def children_names
    names = Array.new
    self.children.each { |c| names << c.name }
    names
  end

  def calculate_proficiency(user)
    (((0.85 * calc_test_proficiency(user)) + (0.15 * calc_q_proficiency(user).to_f)) * 100).to_i
  end

  private

    def calc_test_proficiency(user)
      average = 0

      self.tests.each do |test|
        average = average + test.scores.find_by(user_id: user.id).as_decimal
      end

      average = average / self.tests.count unless average == 0
      average
    end

    def calc_q_proficiency(user)
      Quaestio.new.getUserProficiency(user.profile.first_name, user.profile.last_name)
    end

end
