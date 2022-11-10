class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
     user ||= AdminUser.new # guest user (not logged in)
# sectoristas 21,22,23,29
  case user.categoria # a_variable is the variable we want to compare
     when 1
        # can :manage, :all
        #    can :read, ActiveAdmin::Page, :name =>"Dashboard"
        can :read, ActiveAdmin::Page, :name =>"grafico"
     else
      #can :manage, :all
      # dar categoria 88 para entrar
      #    can [:read,:update],  [AdminUser]
          can :manage, :all
       #    can :read, ActiveAdmin::Page, :name =>"Dashboard"
     #    can :read, ActiveAdmin::Page, :name =>"Dpc"
     #     can [:read,:update],  [AdminUser]


    #  can :read, ActiveAdmin::Page, :name =>"grafico"
  end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
