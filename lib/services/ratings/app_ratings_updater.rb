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
    update_call(App.find_by(title: name))
  end

  def response_load_all
    App.find_each do |cur_app|
      update_call(cur_app)
    end
  end

  def update_call(cur_app)
    return if cur_app.nil?
    start_date = Services::ApiDateManager.last_date(cur_app.id)
    response_android = AppRatingsLoader.call('android', cur_app.android_app_id, start_date)
    response_apple = AppRatingsLoader.call('ios', cur_app.apple_app_id, start_date)
    update_rating(response_android, cur_app, start_date, 'andriod')
    update_rating(response_apple, cur_app, start_date, 'ios')
  end

  def update_rating(response, cur_app, start_date, shop_type)
    (start_date..(Date.today-1)).each_with_index do |cur_date, index|
      Rating.create(rating_1: response[index]['1'], rating_2: response[index]['2'],
                    rating_3: response[index]['3'], rating_4: response[index]['4'],
                    rating_5: response[index]['5'], total_rating: response[index]['total'],
                    average_rating: response[index]['avg'], shop_type: shop_type,
                    date: cur_date.to_s, app_id: cur_app.id)
    end
  end
end
