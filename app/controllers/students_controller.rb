class StudentsController < ApplicationController
  respond_to :json

  def index
    @students = Student.all
    render json: @students
  end
end
