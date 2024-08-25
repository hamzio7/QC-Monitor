class MfTanksController < ApplicationController
  before_action :set_mf_tank, only: %i[ show edit update destroy ]

  # GET /mf_tanks or /mf_tanks.json
  def index
    @mf_tanks = MfTank.all
  end

  # GET /mf_tanks/1 or /mf_tanks/1.json
  def show
  end

  # GET /mf_tanks/new
  def new
    @mf_tank = MfTank.new
  end

  # GET /mf_tanks/1/edit
  def edit
  end

  # POST /mf_tanks or /mf_tanks.json
  def create
    @mf_tank = MfTank.new(mf_tank_params)

    respond_to do |format|
      if @mf_tank.save
        format.html { redirect_to mf_tank_url(@mf_tank), notice: "MF tank was successfully created." }
        format.json { render :show, status: :created, location: @mf_tank }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mf_tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mf_tanks/1 or /mf_tanks/1.json
  def update
    respond_to do |format|
      if @mf_tank.update(mf_tank_params)
        format.html { redirect_to mf_tank_url(@mf_tank), notice: "MF tank was successfully updated." }
        format.json { render :show, status: :ok, location: @mf_tank }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mf_tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mf_tanks/1 or /mf_tanks/1.json
  def destroy
    @mf_tank.destroy!

    respond_to do |format|
      format.html { redirect_to mf_tanks_url, notice: "MF tank was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mf_tank
      @mf_tank = MfTank.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mf_tank_params
      params.require(:mf_tank).permit(:date, :initial_temp, :tank_number, :ph, :viscosity, :density, :reaction_time, :solid_content)
    end
end
