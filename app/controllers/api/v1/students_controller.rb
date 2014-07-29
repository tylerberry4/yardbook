class API::V1::StudentsController < ApplicationController
  respond_to :json
  before_action :find_student, only: [:show, :update, :destroy]

  api :GET, "/students", "List students"
  param_group :user, API::V1::UsersController
  def index
    @students = Student.all
    respond_with @students, each_serializer: StudentSerializer
  end

  api :GET, "/students/:id", "Show an student"
  param_group :user, API::V1::UsersController
  def show
    respond_with @student, serializer: StudentSerializer
  end

  api :POST, "/students", "Create an student"
  param_group :user, API::V1::UsersController
  def create
    @student = Student.new(student_params)
    @student.save
    respond_with @student
  end

  api :PATCH, "/students/:id", "Update an student"
  api :PUT, "/students/:id", "Update an student"
  param_group :user, API::V1::UsersController
  def update
    @student.update(student_params)
    respond_with @student, serializer: StudentSerializer
  end

  api :DELETE, "/students/:id", "Destroy an student"
  param_group :user, API::V1::UsersController
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
