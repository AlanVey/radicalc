# app/authorizers/schedule_authorizer.rb
class SubjectAuthorizer < ApplicationAuthorizer
  # can the user view the subject?
  def self.readable_by?(user)
    (user.has_role? :member, @subject) || (user.has_role? :admin, @subject)
  end

end