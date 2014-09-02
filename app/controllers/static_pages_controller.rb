class StaticPagesController < ApplicationController
  before_action :set_users, only: [:blogs, :repos]
  require 'github.rb'

  def home
    redirect_to homeworks_path if signed_in?
  end

  def about
  end

  def help
  end

  def blogs
  end

  # NB - It's a little weird to see non-static pages in this controller (that is, anything that reads from the
  # database like profile below). It's _really_ weird to be updating blogs here. That seems like it should
  # be on a profile or blog controller - I would never think to look for it here.
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


  private

  def set_users
    @users = User.all
  end
end
