class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]
  before_action :set_assignments, only: [:new, :edit]

  # GET /homeworks
  # GET /homeworks.json
  def index
    @homeworks = Homework.includes(:assignments, :users)
    @assignments = Assignment.includes(:users).order("date asc")
    @users = User.includes(:assignments)
    @table = {}

    # Do a single query to find all of the data. Homework is the joined table
    Homework.find_each do |hw|
      @table[hw.user_id] ||= {}
      @table[hw.user_id][hw.assignment_id] = hw
    end
    @months = []
    Assignment.order("date asc").find_each do |assignment|
      @months << assignment.date.strftime("%B")
    end
    @months.uniq!
    @sort = params[:month] || Time.now.strftime("%B")

    @json_return ={
      assignments: @assignments,
      users: @users,
      table: @table,
      current_user: current_user
    }

    respond_to do |format|
      format.json {render json: @json_return }
      format.html {render :index}
    end
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
    @assignment = @homework.assignment
    # TODO fix n+1 on comments
    # @comments = {}
    # @homework.comments.find_each do |comment|
    #   @comments[comment.user_id] ||= {}
    #   @comments[comment.user_id][comment.id] = comment
    # end
    @comments = @homework.comments
    @comment = Comment.new
    respond_to do |format|
      format.json {render @comments}
      format.html {render :show}
    end
  end

  # GET /homeworks/new
  def new
    @homework = current_user.homeworks.new
    @form = params[:form] || Assignment.last
  end

  # GET /homeworks/1/edit
  def edit
    redirect_to homeworks_path unless @homework.user_id == current_user.id
    @form = params[:form] || Assignment.last
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_homework
    @homework = Homework.find(params[:id])
  end

  def set_assignments
    @assignments = Assignment.all.sort_by{|a| a.date } #.map { |assignment| [assignment.id, "#{assignment.date}: #{assignment.description}"] }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def homework_params
    params.require(:homework).permit(:link_to_homework, :finished, :assignment, :help, :user_id, :assignment_id)
  end
end
