class WelcomeController < ApplicationController
  def index
    @users = User.all
    @admins = Admin.all
    @students = Student.all
    @rubyists = Student.rubyists
  end
end
