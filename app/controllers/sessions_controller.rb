class SessionsController < Clearance::SessionsController

  private
  #This returns the url for redirecting the user after he signs in.
  #it also saves some configurations values to cookies like the user language
  #and color for the template
  def url_after_create
    #Setting the locale cookie.
    I18n.locale = cookies[:locale] = current_user.language
    #Setting the color for the application
    #TODO cookies[:color] = current_user.theme_color
    dashboard_url
  end

  #Returns the url for redirecting a user that logouts from the system.
  def url_after_destroy
    cookies[:locale] = nil
    cookies[:color] = nil
    root_url
  end
end
