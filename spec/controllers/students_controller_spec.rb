require 'rails_helper'

describe StudentsController, :type => :controller do
  describe "GET index" do
    it "shows all students" do
      students = create_list(:student, 2)
      get :index, format: :json
      data = JSON.parse(response.body)
      expect(data).not_to be_empty
      expect(data.first['fname']).to eq students.first.fname
    end
  end
end
