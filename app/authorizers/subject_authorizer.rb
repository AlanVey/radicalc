# app/authorizers/schedule_authorizer.rb
class SubjectAuthorizer < ApplicationAuthorizer
  # can the user view the subject?
  def readable_by?(user)
    (user.has_role? :member, resource) or (user.has_role? :admin, resource)
  end

  def updatable_by?(user)
    user.has_role? :admin, resource
  end

end