class Assignment < ActiveRecord::Base
  has_many :homeworks
  has_many :users, through: :homeworks
end
