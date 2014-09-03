class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all.includes(:user)
  end

  def show
    @assignments = Assignment.all.includes(:users, :homeworks)

    @table = {}
    # Do a single query to find all of the data. Homework is the joined table
    Homework.find_each do |hw|
      @table[hw.user_id] ||= {}
      @table[hw.user_id][hw.assignment_id] = hw
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

end
