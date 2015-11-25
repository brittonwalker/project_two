class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    if user
      can :create, Post
      can [:update, :destroy], Post, :user => user
    end
    if user
      can [:update, :destroy], Comment, :user => user
    end
  end
end
