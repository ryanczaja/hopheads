#Manages Users abilities on the site.
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # if a member, they can manage their own posts 
    # (or create new ones)
    if user.role? :member
      can :manage, Post, :user_id => user.id
      can :manage, Comment, :user_id => user.id
    end

    # Moderators can delete any post
    if user.role? :moderator
      can :destroy, Post
      can :destroy, Comment
    end

    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

    can :read, :all
  end
end
