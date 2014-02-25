class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # if a member, they can manage their own posts 
    # (or create new ones)
    if user.role? :member

    end

    # Moderators can delete any post
    if user.role? :moderator

    end

    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

    can :read, :all
  end
end
