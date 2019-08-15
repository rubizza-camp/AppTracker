module Api
  module V1
    class AppsController < ApplicationController
      def search
        search = App.where('title ilike ?', "%#{params[:name]}%")
        render json: PackageSerializer.new(search, only: [:search_info]).serialized_json
      end
    end
  end
end
