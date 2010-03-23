class ApplicationController < ActionController::Base
  include Clearance::Authentication
  before_filter :set_locale
  before_filter :check_authentication

  helper :all

  protect_from_forgery

  include HoptoadNotifier::Catcher

  #Adds a message to the flash[:notice] hash.
  def notice(message, model = nil)
    case message
    when /updated/i
      message = t('messages.successful_update', :model => model)
    when /created/i
      message = t('messages.successful_create', :model => model)
    end
    flash[:notice] = message
  end

  #Adds an error message to the flash hash.
  def error(message)
    case message
    when /no_update/i
      message = t('messages.error', :confirmation => t('messages.no_update_confirmation'), :check_again => t('messages.check_again'), :try_again => t('messages.try_again'))
    when /no_create/i
      message = t('messages.error', :confirmation => t('messages.no_create_confirmation'), :check_again => t('messages.check_again'), :try_again => t('messages.try_again'))
    end
    flash[:error] = message
  end

  private

  #Checks that a user is authenticated for accessing any of the listed controllers
  def check_authentication
    case self.controller_name
    when /^clients/i, /^ingredients/i, /^orders/i, /^pages/i, /^productpresentations/i, /^products/i
      authenticate
    end
  end

  #Sets the locale for the application. If the users is signed in it will get the user language
  #and saves it to a cookie, this way next time it will check for the cookies value instead
  #of querying the database again.
  def set_locale
    if cookies[:locale].nil?
      if signed_in?
        I18n.locale = cookies[:locale] = current_user.language
      end
      #if not signed in, the locale will be the default (en)
    else
      I18n.locale = cookies[:locale]
    end
  end
end
