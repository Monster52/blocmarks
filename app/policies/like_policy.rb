class LikePolicy
  attr_reader :user, :like

  def initialize(user, like)
    @user = user
    @like = like
  end

  def create?
    user.present?
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
