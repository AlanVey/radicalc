class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :test

  def as_decimal
    self.value.to_f / 100 
  end
end
