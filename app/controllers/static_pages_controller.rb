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

  def update_blog
    respond_to do |format|
      if current_user.update_attribute("blog", params[:blog])
        format.html { redirect_to root_path, notice: 'Homework was successfully updated.' }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def repos
    @repos = []
    @users.each do |user|
      @repos << Github.repos_for(user[:gh_name])
    end
  end

  def profile
    @homeworks = Homework.all
    @assignments = Assignment.all
    @users = User.all
  end

  private

  def set_users
    @users = User.all
  end
end
