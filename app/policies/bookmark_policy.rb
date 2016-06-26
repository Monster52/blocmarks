class BookmarkPolicy
  attr_reader :user, :bookmark

  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (bookmark.user_id == user.id)
  end

  def destroy?
    user.present? && (bookmark.user_id == user.id)
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
