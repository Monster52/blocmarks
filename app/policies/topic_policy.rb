class TopicPolicy < ApplicationPolicy
  attr_reader :user, :topic

  def initialize(user, topic)
    @user = user
    @topic = topic
  end

  def show?
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (topic.user_id == user.id)
  end

  def destroy?
    user.present? && (topic.user_id == user.id)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.present?
        scope.where(:user_id => user.id)
      end
    end

  end
end
