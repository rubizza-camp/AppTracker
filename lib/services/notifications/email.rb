module Services
  module Notifications
    class Email
      def initialize
        @id_to_emails = {}
      end

      private

      def id_to_email_list
        hash = Hash.new { |h, k| h[k] = [] }
        App.find_each do |app|
          app.users.each do |user|
            hash[app.id] << user.email
          end
        end
        @id_to_emails = hash
      end
    end
  end
end
