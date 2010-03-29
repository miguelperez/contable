class UsersController < ApplicationController
  #renders the show page of an user.
  def show
    @user = current_user
  end

  def update

  end
end
