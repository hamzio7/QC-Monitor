class ProductionDaysController < ApplicationController
  before_action :set_production_day, only: %i[ show edit update destroy ]

  # GET /production_days or /production_days.json
  def index
    @production_days = ProductionDay.all
    @resin_programs = ResinProgram.all
    @line_stops = LineStop.all
  end

  # GET /production_days/1 or /production_days/1.json
  def show
  end

  # GET /production_days/new
  def new
    @production_day = ProductionDay.new
  end

  # GET /production_days/1/edit
  def edit
  end

  # POST /production_days or /production_days.json
  def create
    @production_day = ProductionDay.new(production_day_params)

    respond_to do |format|
      if @production_day.save
        format.html { redirect_to production_day_url(@production_day), notice: "Production day was successfully created." }
        format.json { render :show, status: :created, location: @production_day }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @production_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /production_days/1 or /production_days/1.json
  def update
    respond_to do |format|
      if @production_day.update(production_day_params)
        format.html { redirect_to production_day_url(@production_day), notice: "Production day was successfully updated." }
        format.json { render :show, status: :ok, location: @production_day }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @production_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_days/1 or /production_days/1.json
  def destroy
    @production_day.destroy!

    respond_to do |format|
      format.html { redirect_to production_days_url, notice: "Production day was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_production_day
    @production_day = ProductionDay.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def production_day_params
    params.require(:production_day).permit(:date, :shift, :info, :stopped_pallets_count, :approved_pallets_count, :line_number)
  end
end
