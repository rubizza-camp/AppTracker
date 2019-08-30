module Api
  module V1
    class AppsController < ApplicationController
      def index
        return render json: [] if title.empty?

        apps = App.where('title ilike :prefix', prefix: "#{title}%").limit(3)
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
        render json: :successfully_created, status: :ok
      end

      private

      def title
        @title ||= params[:title].delete(' %#')
      end
    end
  end
end
