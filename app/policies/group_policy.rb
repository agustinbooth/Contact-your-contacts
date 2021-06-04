class GroupPolicy < ApplicationPolicy
  attr_reader :user, :group

  def initialize(user, group)
    @user = user
    @group = group
  end

  def show?
    user == group.user
  end

  def create?
    user == group.user
  end

  def new?
    create?
  end

  def update?
    user == group.user
  end

  def edit?
    update?
  end

  def destroy?
    user == group.user
  end
 
end