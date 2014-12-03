class TestQuestion < ActiveRecord::Base
  belongs_to :test
  belongs_to :user
  validates_presence_of :title, :kind, :answer, :user_id, :test_id, :status
  validate :valid_kind?

  @@kinds = ['Multiple Choice', 'PDF Upload Required']

  def valid_kind?
    unless @@kinds.include?(self.kind)
      erros.add(:kind, 'Not a valid kind')
    end
  end

  def self.kinds
    @@kinds
  end
end
