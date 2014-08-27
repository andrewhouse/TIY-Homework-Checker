class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @assignments = Assignment.all
  end
end
