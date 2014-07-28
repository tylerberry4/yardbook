require 'rails_helper'

describe StudentsController, :type => :controller do
  describe "GET index" do
    it "shows all students" do
      students = create_list(:student, 2)
      get :index, format: :json
      data = JSON.parse(response.body)
      expect(data).not_to be_empty
      expect(data['students'].first['fname']).to eq students.first.fname
    end
  end

  describe 'GET :show' do
    it 'shows a student' do
      @student = create(:student)
      get :show, id: @student.id, format: :json
      @data = JSON.parse(response.body)
      expect(@data['student']).to have_key('fname')
      expect(@data['student']['fname']).to eq @student.fname
    end
  end

  describe 'POST :create' do
    before { @student_attributes = attributes_for(:student) }

    it 'succeeds when all attributes are set' do
      expect{ posting_student_status :success }.to change { Student.count }.by(1)
      data = JSON.parse(response.body)
      expect(data['student']).to have_key('fname')
      expect(data['student']['fname']).to eq @student_attributes[:fname]
    end

    it 'fails when a required field is missing' do
      @student_attributes[:fname] = nil
      posting_student_status :unprocessable_entity
    end

    def posting_student_status(status)
      post :create, student: @student_attributes, format: :json
      expect(response).to have_http_status(status)
    end
  end

  describe 'PATCH :update' do
    before { @student = create(:student) }

    it 'succeeds when data changes' do
      patch :update, id: @student.id, student: {fname: 'Billy'}, format: :json
      expect(response).to have_http_status(:success)
      expect(Student.find(@student.id).fname).to eq 'Billy'
    end

    it 'fails when a required field is missing' do
      patch :update, id: @student.id, student: {fname: nil}, format: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Student.find(@student.id).fname).to eq @student.fname
    end
  end

  it 'DELETE :destroy' do
    student = create(:student)
    expect{ delete :destroy, id: student.id, format: :json }.to change { Student.count }.by(-1)
    expect(response).to have_http_status(:no_content)
    expect{Student.find(student.id)}.to raise_error ActiveRecord::RecordNotFound
  end
end
