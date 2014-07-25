require 'rails_helper'

describe UsersController, :type => :controller do
  describe "GET index" do
    it "shows all users" do
      users = create_list(:user, 2)
      get :index, format: :json
      data = JSON.parse(response.body)
      expect(data).not_to be_empty
      expect(data.first['fname']).to eq users.first.fname
    end
  end

#
#   it 'GET #show' do
# #
#   end
#
#   describe 'POST #create' do
#     before {@user_attributes = attributes_for(:user)}
#     it 'succeeds when all attributes are set' do
#     #
#     end
#
#
#     it 'fails when a required field is missing' do
#     #
#     end
#   end
#
#   describe 'PATCH #update' do
#     before {@user = create(:user)}
#     it 'succeeds when valid data are changed' do
#     #
#     end
#
#     it 'fails when valid data are changed' do
#     #
#     end
#   end
#
#   it 'DELETE #destroy' do
#   #
#   end

end

