class Services::Updaters::Ratings < Services::Base

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
    return if start_date > (Time.zone.today - 1)

    response_android = AppRatingsLoader.call('android', cur_app.android_app_id, start_date)
    response_apple = AppRatingsLoader.call('ios', cur_app.apple_app_id, start_date)
    parsed_response_android = 
    update_rating(response_android, cur_app, start_date, 'android')
    update_rating(response_apple, cur_app, start_date, 'ios')
  end

  def update_rating(response, cur_app, start_date, shop_type)
    (start_date..(Time.zone.today - 1)).each_with_index do |cur_date, index|
      @ind = index
      Rating.create(rating_1: rating_1_response(response), rating_2: rating_2_response(response),
                    rating_3: rating_3_response(response), rating_4: rating_4_response(response),
                    rating_5: rating_5_response(response), total_rating: rating_total_response(response),
                    average_rating: rating_avg_response(response), shop_type: shop_type,
                    date: cur_date.to_s, app_id: cur_app.id)
    end
  end
end
