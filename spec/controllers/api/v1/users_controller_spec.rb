require 'rails_helper'

describe API::V1::UsersController, :type => :controller do
  describe "GET index" do
    it "shows all users" do
      users = create_list(:user, 2)
      get :index, format: :json
      expect(response).to be_success
      data = JSON.parse(response.body)
      expect(data).not_to be_empty
      expect(data['users'].first['fname']).to eq users.first.fname
    end
  end
end
