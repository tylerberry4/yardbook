class StudentsController < ApplicationController
  respond_to :json

  def index
    @students = Student.all
    render json: @students, each_serializer: StudentSerializer
  end
end
