class StudentsController < ApplicationController
  respond_to :html, except: :show

  before_action :find_student, only: [:show, :edit, :update, :destroy]

  api :GET, "/students", "List students"
  param_group :user, UsersController
  def index
    @students = Student.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  api :GET, "/students/:id", "Show a student"
  param_group :user, UsersController
  def show
      respond_to do |format|
          format.html
          format.json
      end
  end

  def edit
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
  end

  api :POST, "/students", "Create a student"
  param_group :user, UsersController
  def create
      @student = Student.new(student_params)
      @student.save
      respond_to do |format|
        format.html
        format.json
      end
    end

  api :PATCH, "/students/:id", "Update a student"
  api :PUT, "/students/:id", "Update a student"
  param_group :user, UsersController
  def update
      @student.update(student_params)
      respond_to do |format|
        format.html
        format.json
      end
    end

  api :DELETE, "/students/:id", "Destroy a student"
  param_group :user, UsersController
  def destroy
      @student.destroy
      respond_to do |format|
        format.html
        format.json
      end
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
