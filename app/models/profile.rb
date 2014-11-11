class Profile < ActiveRecord::Base
  mount_uploader :photo, ProfilePicUploader

  validates_presence_of :first_name, :last_name
  
  belongs_to :user

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
