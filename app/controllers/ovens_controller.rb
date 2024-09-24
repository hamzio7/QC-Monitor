class OvensController < ApplicationController
  before_action :set_oven, only: %i[ show edit update destroy ]

  # GET /ovens or /ovens.json
  def index
    @ovens = Oven.all
  end

  # GET /ovens/1 or /ovens/1.json
  def show
  end

  # GET /ovens/new
  def new
    @oven = Oven.new
  end

  # GET /ovens/1/edit
  def edit
  end

  # POST /ovens or /ovens.json
  def create
    @oven = Oven.new(oven_params)

    respond_to do |format|
      if @oven.save
        format.html { redirect_to schedules_path, notice: "Oven was successfully created." }
        format.json { render :show, status: :created, location: @oven }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oven.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ovens/1 or /ovens/1.json
  def update
    respond_to do |format|
      if @oven.update(oven_params)
        format.html { redirect_to schedules_path, notice: "Oven was successfully updated." }
        format.json { render :show, status: :ok, location: @oven }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oven.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ovens/1 or /ovens/1.json
  def destroy
    @oven.destroy!

    respond_to do |format|
      format.html { redirect_to ovens_url, notice: "Oven was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oven
      @oven = Oven.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oven_params
      params.require(:oven).permit(:oven_1, :oven_2, :oven_3, :oven_4, :oven_5, :oven_6, :oven_7, :oven_8, :oven_9, :oven_10, :oven_11, :date, :time, :line_number)
    end
end
