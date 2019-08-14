# == Schema Information
#
# Table name: subs
#
#  id      :bigint           not null, primary key
#  user_id :bigint
#  app_id  :bigint
#

class Subs < ApplicationRecord
  belongs_to :app
  belongs_to :user
end
