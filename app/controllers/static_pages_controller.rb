class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def help
  end

  def contact
  end

  def blogs
    @users = User.all
  end
end
