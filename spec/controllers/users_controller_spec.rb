require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET index" do
    it "shows all users" do
      users = create_list(:user, 2)
      get :index, format: :json
      data = JSON.parse(response.body)
      expect(data).not_to be_empty
      expect(data.first['fname']).to eq users.first.fname
    end
  end

end
