class ContactPolicy < ApplicationPolicy
  attr_reader :user, :contact

  def initialize(user, contact)
    @user = user
    @contact = contact
  end

  def show?
    user == contact.user
  end

  def create?
    user == contact.user
  end

  def new?
    create?
  end

  def update?
    user == contact.user
  end

  def edit?
    update?
  end

  def destroy?
    user == contact.user
  end
end