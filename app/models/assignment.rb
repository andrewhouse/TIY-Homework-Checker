# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  date        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Assignment < ActiveRecord::Base
  has_many :homeworks
  has_many :users, through: :homeworks
end
