module Api
  module V0
    class PackagesController < ApplicationController
      def index
        sql = 'lower(name) like ?'
        name = "%#{params[:name]}%"
        @search = Package.where(sql, name)
        render json: @search
      end
    end
  end
end
