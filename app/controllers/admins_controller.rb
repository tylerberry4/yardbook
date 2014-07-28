class AdminsController < ApplicationController
  before_action :find_admin, only: [:show, :update, :destroy]

  def index
    @admins = Admin.all
  end

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

  def create
    @admin = Admin.new(admin_params)
    @admin.save
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    @admin.update(admin_params)
    respond_to do |format|
      format.html
      format.json
    end
  end

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
