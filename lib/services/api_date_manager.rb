class Services
  class ApiDateManager
    class << self
      def last_date(app_id)
        last_date = ApiAppLastCatchDate.where(app_id: app_id).order(:date).last
        unless last_date.nil?
          last_date_time = last_date.date
          last_date.update(date: (DateTime.now))
          last_date_time.to_date
        else
          ApiAppLastCatchDate.create(:date => DateTime.now, :app_id => app_id)
          (DateTime.now - 1.month).to_date
        end
      end
    end
  end
end