class API::V1::UsersController < ApplicationController
  respond_to :json
  
  api :GET, "/users", "List users"
  def index
    @users = User.all
    respond_with @users, each_serializer: UserSerializer
  end

  def_param_group :full_name do
    param :fname, String
    param :lname, String
  end

  def_param_group :login_info do
    param :email, String
    param :password, String
    param :password_confirmation, String
  end

  def_param_group :stats do
    param :blurb, String #TODO - get apipie to recognize Text ()vs string)
    param :cohort, String
    param :extra, String
    param :role, String
    param :profile_pic, String
  end

  def_param_group :contact_info do
    param :github_url, String
    param :twitter_url, String
    param :linkedin_url, String
    param :webpage, String
  end

  def_param_group :user do
    param :user, Hash do
      param_group :full_name
      param_group :login_info
      param_group :stats
      param_group :contact_info
    end
  end
end
