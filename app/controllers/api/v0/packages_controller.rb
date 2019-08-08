class Api::V0::PackagesController < ApplicationController
  def index
    @packages = Package.all
    render json: @packages
  end

  def show
    render json: Package.where("lower(package_name) like ?", "%#{params[:id]}%")
  end
end
