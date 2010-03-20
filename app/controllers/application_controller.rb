class ApplicationController < ActionController::Base
  include Clearance::Authentication
  before_filter :set_locale
  before_filter :check_authentication

  helper :all

  protect_from_forgery

  include HoptoadNotifier::Catcher

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
