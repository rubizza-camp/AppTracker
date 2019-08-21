module Api
  module V1
    class AppsController < ApplicationController
      def index
        apps = App.where('title like :prefix', prefix: "#{params[:title]}%")
        render json: AppIndexSerializer.new(apps)
      end

      def show
        options = {}
        options[:include] = %i[ratings dynamic_infos]
        app = App.find_by title: params[:title]
        if app.nil?
          render json: {}
        else
          render json: AppSerializer.new(app, options)
        end
      end
    end
  end
end
