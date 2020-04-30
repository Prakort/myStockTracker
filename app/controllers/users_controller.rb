class UsersController < ApplicationController
  #name of function match ==> the view html.erb
  #the view has access to profile
  def profile
    @tracked_stocks = current_user.stocks
    @user = current_user
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)

      if @friends
        respond_to do |format|
          format.js { render partial: 'users/friend_result' }
        end

      else
        respond_to do |format|
          flash.now[:alert] = "No result found."
          format.js { render partial: 'users/friend_result' }
        end
      end    
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a friend name or email to search"
        format.js { render partial: 'users/friend_result' }
      end
    end
  end

  def show 
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end



end
