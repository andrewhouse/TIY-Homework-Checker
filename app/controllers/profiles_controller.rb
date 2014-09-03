class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

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

end
