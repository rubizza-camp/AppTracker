class Api::V0::PackagesController < ApplicationController
  def show
    render json: Package.where("lower(package_name) like ?", "%#{params[:id]}%")
  end
end