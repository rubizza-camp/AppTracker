module Services
  module Notifications
    class Email
      def initialize
        @title = title
      end

      private

      def emails_list(@title)
        arr = []
        App.find_by(title: @title).users.each do |user|
          arr << user.email
        end
        arr
      end
    end
  end
end
