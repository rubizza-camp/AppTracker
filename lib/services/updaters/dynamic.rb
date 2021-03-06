module Services
  module Updaters
    class Dynamic < Services::Base
      attr_reader :downloads, :power, :ranks
      attribute :current_app
      attribute :country
      attribute :start_date
      attribute :dynamic_info
      attribute :shop_type
      attribute :id
      attribute :device

      private

      def perform
        @dynamic_info = {}
        init_params_by_android
        @dynamic_info = {}
        init_params_by_ios
      end

      def init_params_by_android
        @shop_type = 'android'
        @device = nil
        @id = current_app.android_app_id
        update_app
      end

      def init_params_by_ios
        @shop_type = 'ios'
        @device = 'iphone'
        @id = current_app.apple_app_id
        update_app
      end

      def set_start_date
        record = current_app.dynamic_infos.where(shop_type: shop_type,
                                                 country: country).order(date: :desc).limit(1).first
        @start_date = record ? record.date + 1 : Time.zone.today - 1.month
      end

      def update_app
        @start_date = Time.zone.today - 1.month
        load_downloads
        TargetCountry.pluck(:country_name).each do |country|
          @country = country
          set_start_date
          next if start_date > Time.zone.today - 1

          load_power_and_rankings
          parse_dynamic
        end
      end

      def load_power_and_rankings
        load_power
        load_rankings
      end

      def load_downloads
        @downloads = Services::ApptweakApi::Downloads.call(id: id, start_date: start_date,
                                                           shop_type: shop_type, device: device)
      end

      def load_power
        @power = Services::ApptweakApi::Power.call(id: id, start_date: start_date, country: country,
                                                   shop_type: shop_type, device: device)
      end

      def load_rankings
        @ranks = Services::ApptweakApi::Rankings.call(id: id, start_date: start_date, country: country,
                                                      shop_type: shop_type, device: device)
      end

      def parse_dynamic
        parse_downloads
        parse_power
        parse_ranks
        update
      end

      def parse_downloads
        @dynamic_info[:downloads] = Services::Parsers::Downloads.call(response: downloads, country: country)
      end

      def parse_power
        @dynamic_info[:power] = Services::Parsers::Power.call(response: power, country: country)
      end

      def parse_ranks
        @dynamic_info[:ranks] = Services::Parsers::Ranks.call(response: ranks, shop_type: shop_type)
      end

      def update
        (start_date..(Time.zone.today - 1)).each_with_index do |current_date, index|
          create_dynamic(current_date, index)
        end
      end

      def create_dynamic(current_date, index)
        DynamicInfo.create(country: country, date: current_date.to_s, rank: dynamic_ranks(index),
                           power: dynamic_power(index), downloads: dynamic_downloads(index),
                           shop_type: shop_type, device: device, app_id: current_app.id)
      end

      def dynamic_power(index)
        return unless dynamic_info[:power]

        dynamic_info[:power][index]
      end

      def dynamic_ranks(index)
        return unless dynamic_info[:ranks]

        dynamic_info[:ranks][index]
      end

      def dynamic_downloads(index)
        return unless dynamic_info[:downloads]

        dynamic_info[:downloads][index]
      end
    end
  end
end
