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

  validates_presence_of :title, :description, :date

  def description_with_date
    "#{self.date}: #{self.description}"
  end

  def url
    "/assignments/#{self.id}"
  end

  def as_json *args
    super.merge url: url
  end
end
