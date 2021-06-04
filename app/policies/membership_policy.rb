class MembershipPolicy < ApplicationPolicy
    attr_reader :user, :membership

  def initialize(user, membership)
    @user = user
    @membership = membership
  end

  def create?
    true
  end

  def new?
    create?
  end

  def destroy?
    user == membership.group.user && user == membership.contact.user
  end
end