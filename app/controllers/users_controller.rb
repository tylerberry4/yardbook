class UsersController < ApplicationController

  def index
    @users = User.all
    respond to do |format|
      format.html
    end
  end
end
