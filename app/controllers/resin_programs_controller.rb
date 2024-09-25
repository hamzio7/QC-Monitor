class ResinProgramsController < ApplicationController
  before_action :set_resin_program, only: %i[ show edit update destroy ]

  # GET /resin_programs or /resin_programs.json
  def index
    @resin_programs = ResinProgram.all
  end

  # GET /resin_programs/1 or /resin_programs/1.json
  def show
  end

  # GET /resin_programs/new
  def new
    @resin_program = ResinProgram.new
  end

  # GET /resin_programs/1/edit
  def edit
  end

  # POST /resin_programs or /resin_programs.json
  def create

    production_day = ProductionDay.find_or_create_by(date: resin_program_params[:date]) do |pd|
      pd.info = ""
    end

    @resin_program = ResinProgram.new(resin_program_params)
    @resin_program.production_day = production_day

    respond_to do |format|
      if @resin_program.save
        format.html { redirect_to resin_program_url(@resin_program), notice: "Resin program was successfully created." }
        format.json { render :show, status: :created, location: @resin_program }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resin_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resin_programs/1 or /resin_programs/1.json
  def update
    respond_to do |format|
      if @resin_program.update(resin_program_params)
        format.html { redirect_to resin_program_url(@resin_program), notice: "Resin program was successfully updated." }
        format.json { render :show, status: :ok, location: @resin_program }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resin_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resin_programs/1 or /resin_programs/1.json
  def destroy
    @resin_program.destroy!

    respond_to do |format|
      format.html { redirect_to resin_programs_url, notice: "Resin program was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resin_program
    @resin_program = ResinProgram.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def resin_program_params
    params.require(:resin_program).permit(:date, :time, :uf_wlf, :uf_837, :uf_1448, :mf_es700, :mf_es501, :mf_1010, :mf_837, :mf_1014, :uf_tank_num, :mf_tank_num, :mixing_1, :mixing_2, :shift, :line_number)
  end
end
