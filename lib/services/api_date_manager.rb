class Services
  class ApiDateManager
    class << self
      def last_date(app_id)
        last_date = ApiAppLastCatchDate.where(app_id: app_id).order(:date).last
        unless last_date.nil?
          if last_date.date.nil?
            (DateTime.now - 1.month).to_date
          else
            last_date.date.to_date
          end
        else
          ApiAppLastCatchDate.create(:date => nil, :app_id => app_id)
          (DateTime.now - 1.month).to_date
        end
      end

      def update_all
        ApiAppLastCatchDate.all.each do |api_date|
          api_date.update(date: (DateTime.now))
        end
      end
    end
  end
end