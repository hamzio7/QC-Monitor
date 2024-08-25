class ResinTanksController < ApplicationController
  before_action :set_resin_tank, only: %i[ show edit update destroy ]

  # GET /resin_tanks or /resin_tanks.json
  def index
    @resin_tanks = ResinTank.all
  end

  # GET /resin_tanks/1 or /resin_tanks/1.json
  def show
  end

  # GET /resin_tanks/new
  def new
    @resin_tank = ResinTank.new
  end

  # GET /resin_tanks/1/edit
  def edit
  end

  # POST /resin_tanks or /resin_tanks.json
  def create
    @resin_tank = ResinTank.new(resin_tank_params)

    respond_to do |format|
      if @resin_tank.save
        format.html { redirect_to resin_tank_url(@resin_tank), notice: "Resin tank was successfully created." }
        format.json { render :show, status: :created, location: @resin_tank }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resin_tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resin_tanks/1 or /resin_tanks/1.json
  def update
    respond_to do |format|
      if @resin_tank.update(resin_tank_params)
        format.html { redirect_to resin_tank_url(@resin_tank), notice: "Resin tank was successfully updated." }
        format.json { render :show, status: :ok, location: @resin_tank }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resin_tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resin_tanks/1 or /resin_tanks/1.json
  def destroy
    @resin_tank.destroy!

    respond_to do |format|
      format.html { redirect_to resin_tanks_url, notice: "Resin tank was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resin_tank
      @resin_tank = ResinTank.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resin_tank_params
      params.require(:resin_tank).permit(:tank_number, :ph, :viscosity, :density, :initial_temp, :reaction_time, :solid_content)
    end
end
