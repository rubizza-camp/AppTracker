class AppRatingsUpdater
  def self.update(name)
    new.update(name)
  end

  def update(name)
    response_load(name)
  end

  def self.update_all
    new.update_all
  end

  def update_all
    response_load_all
  end

  private

  def response_load(name)
    update_call(cur_app) if cur_app = App.find_by(title: name)
  end

  def response_load_all
    App.find_each do |cur_app|
      update_call(cur_app)
    end
  end

  def update_call(cur_app)
    response = AppRatingsLoader.load(cur_app, Services::ApiDateManager.last_date(cur_app.id))
    update_rating(response[:by_android], cur_app)
    update_rating(response[:by_apple], cur_app)
  end

  def update_rating(response, cur_app)
    date_period = response[:date_period]
    (date_period[:start_date]..date_period[:end_date]).each_with_insex do |cur_date, index|
      Rating.create(rating_1: response[:ratings][index]['1'], rating_2: response[:ratings][index]['2'],
                    rating_3: response[:ratings][index]['3'], rating_4: response[:ratings][index]['4'],
                    rating_5: response[:ratings][index]['5'], total_rating: response[:ratings][index]['total'],
                    average_rating: response[:ratings][index]['avg'], shop_type: response[:shop_type],
                    date: cur_date.to_s, app_id: cur_app.id)
    end
  end
end
