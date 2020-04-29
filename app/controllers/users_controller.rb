class UsersController < ApplicationController
  #name of function match ==> the view html.erb
  #the view has access to profile
  def profile
    @tracked_stocks = current_user.stocks
  end
end
