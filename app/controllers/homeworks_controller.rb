class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]
  before_action :set_assignments, only: [:new, :edit]

  def incomplete
    index
  end

  def complete
    index
  end
  # GET /homeworks
  # GET /homeworks.json
  def index
    @homeworks = Homework.all
    @assignments = Assignment.all
    @users = User.all
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
    redirect_to homeworks_path unless @homework.user_id == current_user.id
  end

  # GET /homeworks/new
  def new
    @homework = current_user.homeworks.new
  end

  # GET /homeworks/1/edit
  def edit
    redirect_to homeworks_path unless @homework.user_id == current_user.id
  end

  # POST /homeworks
  # POST /homeworks.json
  def create
    @homework = current_user.homeworks.new(homework_params)

    respond_to do |format|
      if @homework.save
        format.html { redirect_to @homework, notice: 'Homework was successfully created.' }
        format.json { render :show, status: :created, location: @homework }
      else
        format.html { render :new }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    respond_to do |format|
      if @homework.update(homework_params)
        format.html { redirect_to @homework, notice: 'Homework was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework }
      else
        format.html { render :edit }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to homeworks_url, notice: 'Homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mine
    index
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_homework
    @homework = Homework.find(params[:id])
  end

  def set_assignments
    @assignments = Assignment.all.reverse.map { |assignment| "#{assignment.id} - #{assignment.date}: #{assignment.description}" }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def homework_params
    params.require(:homework).permit(:link_to_homework, :finished, :assignment, :help, :user_id, :assignment_id)
  end
end
