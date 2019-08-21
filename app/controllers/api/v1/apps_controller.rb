module Api
  module V1
    class AppsController < ApplicationController
      def index
        apps = App.where('title like :prefix', prefix: "#{params[:title]}%")
        render json: AppIndexSerializer.new(apps)
      end

      def show
        app = App.find_by title: params[:title]
        if app.nil?
          render json: {}
        else
          render json: {
            app: AppSerializer.new(app),
            dynamic_info: DynamicInfoSerializer.new(app.dynamic_infos),
            ratings: RatingSerializer.new(app.ratings)
          }
        end
      end
    end
  end
end
