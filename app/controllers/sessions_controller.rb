class SessionsController < Devise::SessionsController
  api :POST, "/users/sign_in", "Create a session"
  param_group :login_info, UsersController
  def create
    user = warden.authenticate!(:scope => :user, :recall => "#{controller_path}#failure")
    sign_in(:user, user)
    render :json => {:success => true, :current_user => current_user.id}
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
