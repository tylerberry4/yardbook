class AdminsController < ApplicationController
  respond_to :json

  def index
    @admins = Admin.all
    render json: @admins, each_serializer: AdminSerializer
  end
end
