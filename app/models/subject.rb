class Subject < ActiveRecord::Base
  validates_presence_of :name, :body, :user_id
  belongs_to :user
  has_many :questions

  acts_as_tree

  def get_ancestors
    [ self ] + self.ancestors
  end
end