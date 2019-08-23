class Services
  class TargetApps
    class << self
      def add(name)
        TargetApp.create(application_name: name)
        logger.dedug("Adding #{name} completed")
      end

      def list
        TargetApp.all.each_with_index do |target_app, index|
          logger.dedug("#{index + 1}. #{target_app.application_name}")
        end
      end

      def remove(name)
        TargetApp.where(application_name: name).destroy_all
        logger.dedug("Removing #{name} completed")
      end
    end
  end
end
