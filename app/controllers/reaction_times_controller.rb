class ReactionTimesController < ApplicationController
  before_action :set_reaction_time, only: %i[ show edit update destroy ]

  # GET /reaction_times or /reaction_times.json
  def index
    @reaction_times = ReactionTime.all
  end

  # GET /reaction_times/1 or /reaction_times/1.json
  def show
  end

  # GET /reaction_times/new
  def new
    @reaction_time = ReactionTime.new
    @date = params[:date]
    @time = params[:time]
  end

  # GET /reaction_times/1/edit
  def edit
  end

  # POST /reaction_times or /reaction_times.json
  def create
    @reaction_time = ReactionTime.new(reaction_time_params)

    respond_to do |format|
      if @reaction_time.save
        format.html { redirect_to schedules_path }
        format.json { render :show, status: :created, location: @reaction_time }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reaction_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reaction_times/1 or /reaction_times/1.json
  def update
    respond_to do |format|
      if @reaction_time.update(reaction_time_params)
        format.html { redirect_to reaction_time_url(@reaction_time), notice: "Reaction time was successfully updated." }
        format.json { render :show, status: :ok, location: @reaction_time }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reaction_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reaction_times/1 or /reaction_times/1.json
  def destroy
    @reaction_time.destroy!

    respond_to do |format|
      format.html { redirect_to reaction_times_url, notice: "Reaction time was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reaction_time
      @reaction_time = ReactionTime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reaction_time_params
      params.require(:reaction_time).permit(:gel_time, :cloudy_time, :time, :date)
    end
end
