class OvenTempsController < ApplicationController
  before_action :set_oven_temp, only: %i[ show edit update destroy ]

  # GET /oven_temps or /oven_temps.json
  def index
    @oven_temps = OvenTemp.all
  end

  # GET /oven_temps/1 or /oven_temps/1.json
  def show
  end

  # GET /oven_temps/new
  def new
    @oven_temp = OvenTemp.new
  end

  # GET /oven_temps/1/edit
  def edit
  end

  # POST /oven_temps or /oven_temps.json
  def create
    @oven_temp = OvenTemp.new(oven_temp_params)

    respond_to do |format|
      if @oven_temp.save
        format.html { redirect_to oven_temp_url(@oven_temp), notice: "Oven temp was successfully created." }
        format.json { render :show, status: :created, location: @oven_temp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oven_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oven_temps/1 or /oven_temps/1.json
  def update
    respond_to do |format|
      if @oven_temp.update(oven_temp_params)
        format.html { redirect_to oven_temp_url(@oven_temp), notice: "Oven temp was successfully updated." }
        format.json { render :show, status: :ok, location: @oven_temp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oven_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oven_temps/1 or /oven_temps/1.json
  def destroy
    @oven_temp.destroy!

    respond_to do |format|
      format.html { redirect_to oven_temps_url, notice: "Oven temp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oven_temp
      @oven_temp = OvenTemp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oven_temp_params
      params.require(:oven_temp).permit(:oven_number, :temperature, :time , :date)
    end
end
