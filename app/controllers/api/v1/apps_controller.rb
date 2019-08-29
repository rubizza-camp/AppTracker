module Api
  module V1
    class AppsController < ApplicationController
      def index
        apps = App.where('title ilike :prefix', prefix: "#{params[:title]}%")
        render json: AppIndexSerializer.new(apps)
      end

      def show
        app = App.find_by id: params[:id]
        if app.nil?
          render json: {}
        else
          render json: AppSerializer.new(app, include: %i[ratings dynamic_infos])
        end
      end

      def create
        Services::UpdateManager.call(title: params[:title])
        render json: {'Successfully created'}
      end
    end
  end
end
