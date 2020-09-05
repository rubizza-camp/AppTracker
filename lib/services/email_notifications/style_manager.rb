module Services
  module EmailNotifications
    class StyleManager < Services::Base
    attribute :icon_metric_difference
    attribute :style_metric_difference

    private

      def perform
        return icon if icon_metric_difference
        style if style_metric_difference
      end

      def style
        return "ratings-up" if style_metric_difference > 0
        "ratings-down" if style_metric_difference < 0
      end

      def icon
        return "image_tag(attachments['trending_up_icon.png'].url)" if icon_metric_difference > 0
        "image_tag(attachments['trending_down_icon.png'].url)" if icon_metric_difference < 0
      end
    end
  end
end
