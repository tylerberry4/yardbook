require 'rails_helper'

describe AdminsController, :type => :controller do
  describe "GET index" do
    it "shows all admins" do
      admins = create_list(:admin, 2)
      get :index, format: :json
      data = JSON.parse(response.body)
      expect(data).not_to be_empty
      expect(data.first['fname']).to eq admins.first.fname
    end
  end
end
