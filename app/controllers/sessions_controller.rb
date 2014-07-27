class SessionsController < Devise::SessionsController
  api :POST, "/users/sign_in", "Create a session"
  param_group :login_info, UsersController
  def create
    user = warden.authenticate!(:scope => :user, :recall => "#{controller_path}#failure")
    sign_in_and_redirect(:user, user)
  end

  def sign_in_and_redirect(resource_or_scope, user=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    user ||= resource_or_scope
    sign_in(scope, user) unless warden.user(scope) == user
    render :json => {:success => true}
  end

  def failure
    render :json => {:success => false, :errors => ["Login failed."]}
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(:user))
    respond_to_on_destroy if signed_out
  end

  private

  def respond_to_on_destroy
    render :json => {:log_out => true }
  end
end
