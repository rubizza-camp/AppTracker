module Api
  module V0
    class PackagesController < ApplicationController
      def index
        @search = Package.where('name ilike ?', "%#{params[:name]}%")
        @json_string = PackageSerializer.new(@search)
        render json: @json_string
      end
    end
  end
end
