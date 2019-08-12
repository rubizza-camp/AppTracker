# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  email         :string
#  login         :string
#  name          :string
#  password      :string
#  role          :string
#  image         :string
#  subscriptions :json
#

class User < ApplicationRecord
end
