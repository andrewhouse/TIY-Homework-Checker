class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :create_profile

  def index
    @profiles = Profile.all.includes(:user)
  end

  def show
    @assignments = Assignment.all.includes(:users, :homeworks)
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def create_profile
    users = User.all.includes(:profile)
    users.each do |user|
      unless user.profile
        Profile.create(user_id: user.id)
      end
    end
  end
end
