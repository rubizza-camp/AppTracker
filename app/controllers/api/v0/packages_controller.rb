module Api
  module V0
    class PackagesController < ApplicationController
      def index
        @search = Package.where('name ilike ?', "%#{params[:name]}%")
        render json: @search
      end
    end
  end
end
