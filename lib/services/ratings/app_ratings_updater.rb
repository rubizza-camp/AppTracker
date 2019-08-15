class AppRatingsUpdater < AppMothership
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
    app_id = App.where(title: name).first.android_app_id
    ratings = AppRatingsLoader.load_by_android(app_id, Services::ApiDateManager.last_date(app_id))
    ratings.each do |rating|
    Ratings.create(rating_1: rating['1'], rating_2: rating['2'], rating_3: rating['3'], rating_4: rating['4'],
                   rating_5: rating['5'], total_rating: rating['total'], average_rating: rating['avg'],
                   shop_type: 'android', date: , app_id: app_id)
    end
  end

  def update_by_apple(name)
    app_id = App.where(title: name).first.apple_app_id
    ratings = AppRatingsLoader.load_by_apple(app_id, Services::ApiDateManager.last_date(app_id))
    Ratings.create(rating_1: rating['1'], rating_2: rating['2'], rating_3: rating['3'], rating_4: rating['4'],
                   rating_5: rating['5'], total_rating: rating['total'], average_rating: rating['avg'],
                   shop_type: 'apple', date: , app_id: app_id)
  end

  def update_all_by_android
    App.all.each do |app|
      ratings = AppRatingsLoader.load_by_android(app.id, Services::ApiDateManager.last_date(app_id))
      Ratings.create(rating_1: rating['1'], rating_2: rating['2'], rating_3: rating['3'], rating_4: rating['4'],
                     rating_5: rating['5'], total_rating: rating['total'], average_rating: rating['avg'],
                     shop_type: 'android', date: , app_id: app_id)
    end
  end

  def update_all_by_apple
    App.all.each do |app|
      ratings = AppRatingsLoader.load_by_apple(app.id, Services::ApiDateManager.last_date(app_id))
      Ratings.create(rating_1: rating['1'], rating_2: rating['2'], rating_3: rating['3'], rating_4: rating['4'],
                     rating_5: rating['5'], total_rating: rating['total'], average_rating: rating['avg'],
                     shop_type: 'apple', date: , app_id: app_id)
    end
  end
end
