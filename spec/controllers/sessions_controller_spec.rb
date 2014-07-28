require 'rails_helper'

describe SessionsController, :type => :controller do
  before :each do
    @user = create(:user)
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  def login_status(user)
    post :create, user: { email: user.email, password: user.password }, format: :json
    data = JSON.parse(response.body)
    data['success'] && data['current_user'] == user.id
  end

  it 'successfully logs in a user' do
    expect(login_status(@user)).to eq true
  end

  it 'rejects incorrect passwords' do
    @user.password = 'not_password'
    expect(login_status(@user)).to eq false
  end

  it 'rejects incorrect emails' do
    @user.email = 'not_email'
    expect(login_status(@user)).to eq false
  end

  it 'successfully logs out a user' do
    expect(login_status(@user)).to eq true
    get :destroy, format: :json
    data = JSON.parse(response.body)
    expect(data['log_out']).to eq true
  end
end
