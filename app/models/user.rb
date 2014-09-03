# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  blog                   :string(255)
#  gh_name                :string(255)
#  admin                  :string(255)      default("f")
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Gravtastic
  gravtastic size: '250'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :homeworks
  has_many :assignments, through: :homeworks

  has_many :identities

  has_one :profile

  after_create :create_profile

  def homework_for assignment
    self.homeworks.where(assignment: assignment.id).first
  end

  def blog_url
    if self.try(:blog)
      if blog.include?('http://')
        blog
      else
        "http://#{blog}"
      end
    else
      ""
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  private

  def create_profile
    Profile.create(user_id: id)
  end
end
