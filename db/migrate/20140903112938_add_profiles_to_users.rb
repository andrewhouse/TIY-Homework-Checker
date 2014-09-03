class AddProfilesToUsers < ActiveRecord::Migration
  def change
    User.includes(:profile).find_each do |user|
      next if user.profile
      Profile.create! user: user
    end
  end
end
