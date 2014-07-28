class API::V1::AdminsController < ApplicationController
  respond_to :json
  before_action :find_admin, only: [:show, :update, :destroy]

  api :GET, "/admins", "List admins"
  param_group :user, API::V1::UsersController
  def index
    @admins = Admin.all
    respond_with @admins, each_serializer: AdminSerializer
  end

  api :GET, "/admins/:id", "Show an admin"
  param_group :user, API::V1::UsersController
  def show
    respond_with @admin, serializer: AdminSerializer
  end

  api :POST, "/admins", "Create an admin"
  param_group :user, API::V1::UsersController
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      respond_with status: :created
    else
      respond_with @admin.errors, status: :unprocessable_entity
    end
  end

  api :PATCH, "/admins/:id", "Update an admin"
  api :PUT, "/admins/:id", "Update an admin"
  param_group :user, API::V1::UsersController
  def update
    @admin.update(admin_params)
    respond_with @admin, serializer: AdminSerializer
  end

  api :DELETE, "/admins/:id", "Destroy an admin"
  param_group :user, API::V1::UsersController
  def destroy
    @admin.destroy
  end

  private
  def find_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :fname, :lname, :blurb, :password, :password_confirmation,
                                    :github_url, :twitter_url, :linkedin_url,
                                    :webpage, :cohort, :extra, :role, :profile_pic)
  end
end
