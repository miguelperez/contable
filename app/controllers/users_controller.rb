class UsersController < ApplicationController
  after_filter :set_locale
  
  #renders the show page of an user.
  def show
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.language = params[:user][:language]
    @user.color = create_color(params[:user])
    if @user.save
      flash[:notice] = t('messages.successful_update', :model => User.human_name)
    else
      flash[:error] = t('messages.no_update_confirmation')
    end
    flash.keep
    redirect_to user_path(current_user.id)
  end
  
  private
  
  def set_locale
    #Setting the locale cookie.
    I18n.locale = cookies[:locale] = current_user.language
  end
  
  #Returns a hash that contains the information of the users color.
  def create_color(params)
    red = params[:red]
    green = params[:green]
    blue = params[:blue]
    if red && green && blue
      {'red' => red, 'green' => green, 'blue' => blue}
    else
      {:red => 0, :green => 0, :blue => 0}
    end
  end
end
