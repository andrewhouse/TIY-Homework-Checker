# == Schema Information
#
# Table name: homeworks
#
#  id               :integer          not null, primary key
#  link_to_homework :string(255)
#  finished         :boolean
#  help             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer
#  assignment_id    :integer
#

class Homework < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  has_many :comments
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :link_to_homework, presence: true

  def url
    if link_to_homework.include?('http://')
      link_to_homework
    else
      "http://#{link_to_homework}"
    end
  end

  def homework_path
    "/homeworks/#{self.id}"
  end

  def as_json *args
    super.merge({url: url, homework_path: homework_path})
  end
end
