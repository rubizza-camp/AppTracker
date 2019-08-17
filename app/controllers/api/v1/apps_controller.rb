module Api
  module V1
    class AppsController < ApplicationController
      def index
        apps = App.where('title like :prefix', prefix: "#{params[:title]}%")
        render json: AppSerializer.new(apps, fields: { app: [:search_data] })
      end

      def show
        app = App.find_by title: params[:title]
        options = {}
        options[:include] = %i[ratings dynamic_infos]
        render json: AppSerializer.new([app], options)
      end
    end
  end
end
