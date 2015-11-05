class WikiPolicy < ApplicationPolicy
 
# def index?
#   true
# end
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user, @scope = user, scope
    end

    def resolve
      wikis = []
      the_wikis = scope.all
      if user.admin?
        wikis = scope.all
      elsif user.premium?
        the_wikis.each do |wiki|
          if wiki.public? || wiki.user == user || wiki.users.include?(user)
            wikis << wiki
          end
        end
      elsif user.standard?
        the_wikis.each do |wiki|
          if wiki.public? 
            wikis << wiki
          end
        end
      else
        wikis = scope.none
      end
      wikis
    end
  end

end