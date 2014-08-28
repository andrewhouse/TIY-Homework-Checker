class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  serialize :auth_data, JSON

  %w(name email image).each do |attr|
    define_method attr do
      auth_data.fetch("info").fetch(attr)
    end
  end

  def first_name
    name.split(' ').first
  end

  def last_name
    name.split(' ').last
  end

  def github_name
    auth_data.fetch("info").fetch("nickname")
  end
end
