class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    if user
      can :create, Post
      can [:update, :destroy], Post, :user => user
    end
  end
end
