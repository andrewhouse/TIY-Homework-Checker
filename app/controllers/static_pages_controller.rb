class StaticPagesController < ApplicationController
  before_action :set_users, only: [:blogs, :repos]
  require 'github.rb'

  def home
  end

  def about
  end

  def help
  end

  def contact
  end

  def blogs
  end

  def repos
    @repos = []
    @users.each do |user|
      @repos << Github.repos_for(user[:gh_name])
    end
  end

  private

  def set_users
    @users = User.all
  end
end
