module Api
  module V1
    class AppsController < ApplicationController
      def index
        search = App.where('title ilike ?', "%#{params[:title]}%")
        render json: search.to_json(only: [:title, :apple_url, :android_url, :icon_url])
      end

      def show
        app = App.find_by title: params[:title]
        render json: app.to_json(include: [:ratings, :dynamic_infos])
      end
    end
  end
end
