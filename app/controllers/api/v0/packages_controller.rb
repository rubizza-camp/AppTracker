module Api
  module V0
    class PackagesController < ApplicationController
      def show
        sql = 'lower(package_name) like ?'
        name = "%#{params[:id]}%"
        @search = Package.where(sql, name)
        render json: @search
      end
    end
  end
end
