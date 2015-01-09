class Subject < ActiveRecord::Base
  validates_presence_of :name, :body, :user_id
  mount_uploader :icon, ProfilePicUploader

  resourcify
  include Authority::Abilities
  belongs_to :user
  has_many :questions
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

end
