class AdminsController < ApplicationController
  before_action :find_admin, only: [:show, :update, :destroy]

  api :GET, "/admins", "List admins"
  param_group :user, UsersController
  def index
    @admins = Admin.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  api :GET, "/admins/:id", "Show an admin"
  param_group :user, UsersController
  def edit
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  api :POST, "/admins", "Create an admin"
  param_group :user, UsersController
  def create
    @admin = Admin.new(admin_params)
    @admin.save
    respond_to do |format|
      format.html
      format.json
    end
  end

  api :PATCH, "/admins/:id", "Update an admin"
  api :PUT, "/admins/:id", "Update an admin"
  param_group :user, UsersController
  def update
    @admin.update(admin_params)
    respond_to do |format|
      format.html
      format.json
    end
  end

  api :DELETE, "/admins/:id", "Destroy an admin"
  param_group :user, UsersController
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html
      format.json
    end
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

