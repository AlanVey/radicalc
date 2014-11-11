class Profile < ActiveRecord::Base
  mount_uploader :photo, ProfilePicUploader
  
  belongs_to :user
end
