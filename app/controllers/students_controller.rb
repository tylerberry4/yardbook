class StudentsController < ApplicationController
  respond_to :json

  before_action :find_student, only: [:show, :update, :destroy]

  api :GET, "/students", "List students"
  param_group :user, UsersController
  def index
    @students = Student.all
    render json: @students
  end

  api :GET, "/students/:id", "Show a student"
  param_group :user, UsersController
  def show
      respond_to do |format|
          format.html
          format.json
      end
  end

  api :POST, "/students", "Create a student"
  param_group :user, UsersController
  def create
      @student = Student.new(student_params)
      @student.save
      respond_with @student
    end

  api :PATCH, "/students/:id", "Update a student"
  api :PUT, "/students/:id", "Update a student"
  param_group :user, UsersController
  def update
      @student.update(student_params)
      respond_with @student
    end

  api :DELETE, "/students/:id", "Destroy a student"
  param_group :user, UsersController
  def destroy
      @student.destroy
      respond_with @student
    end

  private
  def find_student
      @student = Student.find(params[:id])
    end

  def student_params
      params.require(:student).permit(:email, :fname, :lname, :blurb, :password, :password_confirmation,
                                      :github_url, :twitter_url, :linkedin_url,
                                      :webpage, :cohort, :extra, :role, :profile_pic)
  end
end
