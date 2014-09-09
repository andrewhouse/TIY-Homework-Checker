class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :homework
  validates_presence_of :user_id, :homework_id, :body
  validates :body, length: {maximum: 15000}
end
