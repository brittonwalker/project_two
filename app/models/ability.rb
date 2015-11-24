class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    if user
      can :create, Post
      can [:update, :destroy], Post, :user => user # NHO: How could we implement the same rules for comments as well?
    end
  end
end
