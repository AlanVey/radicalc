class Subject < ActiveRecord::Base
  validates_presence_of :name, :body, :user_id, :debate_type
  validate :debate_type_is_technical_or_management?

  resourcify
  include Authority::Abilities
  belongs_to :user
  has_many :questions
  acts_as_tree


  def debate_type_is_technical_or_management?
    unless debate_type == 'technical' || debate_type == 'management'
      errors.add(:debate_type, "unrecognized type of node")
    end
  end

  def has_technical_debate?
    if debate_type == 'technical'
      true
    else
      false
    end
  end

end