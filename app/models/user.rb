# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  email    :string
#  login    :string
#  name     :string
#  password :string
#  role     :string
#  image    :string
#

class User < ApplicationRecord
  has_many :subs, dependent: :destroy
  has_many :apps,
           through: :subs
end
