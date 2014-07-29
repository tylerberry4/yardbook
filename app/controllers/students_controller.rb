class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
    respond_to do |format|
        format.html
    end
  end

  def edit
    respond_to do |format|
      format.html
    end
  end

  def create
    @student = Student.new(student_params)
    @student.save
    respond_to do |format|
      format.html
    end
  end

  def update
    @student.update(student_params)
    redirect_to @student
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html
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
