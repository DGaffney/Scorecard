# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include ReCaptcha::AppHelper
  helper :all
  helper_method :current_user_session, :current_user, :admin?
  filter_parameter_logging :password, :password_confirmation
  
  def welcome
    @survey = Survey.first
    render :layout => 'application' 
  end
  
  def admin?
    return !current_user.nil? && current_user.role == "admin"
  end
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def admin?
      return !current_user.nil? && current_user.role == "admin"
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user || (current_user and current_user.anonymous?)
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
    def require_login
      login_as_trial_user unless current_user_session
    end

    def login_as_trial_user
      name = "anonymous_#{Time.now.to_i}"
      UserSession.create(User.find_by_login(name) || User.create(:login => name, :password => name, :password_confirmation => name, :anonymous => true),false)
      @current_user_session = UserSession.find
    end
end
