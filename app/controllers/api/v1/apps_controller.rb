module Api
  module V1
    class AppsController < ApplicationController
      def index
        search = App.where('title like :prefix', prefix: "#{params[:title]}%")
        render json: AppSerializer.new(search, fields: { app: [:search_data] })
      end

      def show
        app = App.find_by title: params[:title]
        render json: AppSerializer.new(app)
      end
    end
  end
end
