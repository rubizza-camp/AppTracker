class AppRatingsUpdater
  def self.update(name)
    new.update(name)
  end

  def update(name)
    update_by_android(name)    
    update_by_apple(name)
  end

  def self.update_all
    new.update_all
  end

  def update_all
    update_all_by_android
    update_all_by_apple
  end

  private

  def update_by_android(name)
    app_id = App.find_by_title(name).android_app_id
    response = AppRatingsLoader.load_by_android(app_id, Services::ApiDateManager.last_date(App.find_by_title(name).id))
    ratings = response[:ratings]
    date_period = response[:date_period]
    ratings.each do |rating|
      Rating.create(rating_1: rating['1'], rating_2: rating['2'], rating_3: rating['3'], rating_4: rating['4'],
                    rating_5: rating['5'], total_rating: rating['total'], average_rating: rating['avg'],
                    shop_type: 'android', date: date_period.to_s, app_id: App.find_by_title(name).id)
      date_period = date_period + 1
    end
  end

  def update_by_apple(name)
    app_id = App.find_by_title(name).apple_app_id
    response = AppRatingsLoader.load_by_apple(app_id, Services::ApiDateManager.last_date(App.find_by_title(name).id))
    ratings = response[:ratings]
    date_period = response[:date_period]
    ratings.each do |rating|
      Rating.create(rating_1: rating['1'], rating_2: rating['2'], rating_3: rating['3'], rating_4: rating['4'],
                    rating_5: rating['5'], total_rating: rating['total'], average_rating: rating['avg'],
                    shop_type: 'apple', date: date_period.to_s, app_id: App.find_by_title(name).id)
      date_period = date_period + 1
    end
  end

  def update_all_by_android
    App.all.each do |app|
      response = AppRatingsLoader.load_by_android(app.android_app_id, Services::ApiDateManager.last_date(app.id))
      ratings = response[:ratings]
      date_period = response[:date_period]
      ratings.each do |rating|  
        Rating.create(rating_1: rating['1'], rating_2: rating['2'], rating_3: rating['3'], rating_4: rating['4'],
                      rating_5: rating['5'], total_rating: rating['total'], average_rating: rating['avg'],
                      shop_type: 'android', date: date_period.to_s, app_id: app.id)
        date_period = date_period + 1
      end
    end
  end

  def update_all_by_apple
    App.all.each do |app|
      response = AppRatingsLoader.load_by_apple(app.apple_app_id, Services::ApiDateManager.last_date(app.id))
      ratings = response[:ratings]
      date_period = response[:date_period]
      ratings.each do |rating|
        Rating.create(rating_1: rating['1'], rating_2: rating['2'], rating_3: rating['3'], rating_4: rating['4'],
                      rating_5: rating['5'], total_rating: rating['total'], average_rating: rating['avg'],
                      shop_type: 'apple', date: date_period.to_s, app_id: app.id)
        date_period = date_period + 1
      end
    end
  end
end
