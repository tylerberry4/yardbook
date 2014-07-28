require 'rails_helper'

describe AdminsController, :type => :controller do
  describe "GET index" do
    it "shows all admins" do
      admins = create_list(:admin, 2)
      get :index, format: :json
      data = JSON.parse(response.body)
      expect(data).not_to be_empty
      expect(data['admins'].first['fname']).to eq admins.first.fname
    end
  end

  describe 'GET :show' do
    it 'shows an admin' do
      @admin = create(:admin)
      get :show, id: @admin.id, format: :json
      @data = JSON.parse(response.body)
      expect(@data['admin']).to have_key('fname')
      expect(@data['admin']['fname']).to eq @admin.fname
    end
  end

  describe 'POST :create' do
    before { @admin_attributes = attributes_for(:admin) }

    it 'succeeds when all attributes are set' do
      expect{ posting_admin_status :success }.to change { Admin.count }.by(1)
      data = JSON.parse(response.body)
      expect(data['admin']).to have_key('fname')
      expect(data['admin']['fname']).to eq @admin_attributes[:fname]
    end

    it 'fails when a required field is missing' do
      @admin_attributes[:fname] = nil
      posting_admin_status :unprocessable_entity
    end

    def posting_admin_status(status)
      post :create, admin: @admin_attributes, format: :json
      expect(response).to have_http_status(status)
    end
  end

  describe 'PATCH :update' do
    before { @admin = create(:admin) }

    it 'succeeds when data changes' do
      patch :update, id: @admin.id, admin: {fname: 'Billy'}, format: :json
      expect(response).to have_http_status(:success)
      expect(Admin.find(@admin.id).fname).to eq 'Billy'
    end

    it 'fails when a required field is missing' do
      patch :update, id: @admin.id, admin: {fname: nil}, format: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Admin.find(@admin.id).fname).to eq @admin.fname
    end
  end

  it 'DELETE :destroy' do
    admin = create(:admin)
    expect{ delete :destroy, id: admin.id, format: :json }.to change { Admin.count }.by(-1)
    expect(response).to have_http_status(:no_content)
    expect{Admin.find(admin.id)}.to raise_error ActiveRecord::RecordNotFound
  end
end
