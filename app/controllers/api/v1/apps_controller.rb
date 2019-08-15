module Api
  module V1
    class AppsController < ApplicationController
      def index
        search = App.where('title ilike ?', "%#{params[:title]}%")
        render json: AppSerializer.new(search, only: [:search_info]).serialized_json
      end

      def show
        app = App.find_by title: params[:title]
        render json: AppSerializer.new(app, except: [:search_info]).serialized_json
      end
    end
  end
end
