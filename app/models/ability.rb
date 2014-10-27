class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, Course
    end
  end
end
