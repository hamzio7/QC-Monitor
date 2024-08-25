class UfTanksController < ApplicationController
  before_action :set_uf_tank, only: %i[ show edit update destroy ]

  # GET /uf_tanks or /uf_tanks.json
  def index
    @uf_tanks = UfTank.all
  end

  # GET /uf_tanks/1 or /uf_tanks/1.json
  def show
  end

  # GET /uf_tanks/new
  def new
    @uf_tank = UfTank.new
  end

  # GET /uf_tanks/1/edit
  def edit
  end

  # POST /uf_tanks or /uf_tanks.json
  def create
    @uf_tank = UfTank.new(uf_tank_params)

    respond_to do |format|
      if @uf_tank.save
        format.html { redirect_to uf_tank_url(@uf_tank), notice: "UF tank was successfully created." }
        format.json { render :show, status: :created, location: @uf_tank }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @uf_tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uf_tanks/1 or /uf_tanks/1.json
  def update
    respond_to do |format|
      if @uf_tank.update(uf_tank_params)
        format.html { redirect_to uf_tank_url(@uf_tank), notice: "UF tank was successfully updated." }
        format.json { render :show, status: :ok, location: @uf_tank }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @uf_tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uf_tanks/1 or /uf_tanks/1.json
  def destroy
    @uf_tank.destroy!

    respond_to do |format|
      format.html { redirect_to uf_tanks_url, notice: "UF tank was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uf_tank
      @uf_tank = UfTank.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def uf_tank_params
      params.require(:uf_tank).permit(:date, :initial_temp, :tank_number, :ph, :viscosity, :density, :reaction_time, :solid_content)
    end
end
