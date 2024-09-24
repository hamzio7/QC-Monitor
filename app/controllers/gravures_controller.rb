class GravuresController < ApplicationController
  before_action :set_gravure, only: %i[ show edit update destroy ]

  # GET /gravures or /gravures.json
  def index
    @gravures = Gravure.all
  end

  # GET /gravures/1 or /gravures/1.json
  def show
  end

  # GET /gravures/new
  def new
    @gravure = Gravure.new
  end

  # GET /gravures/1/edit
  def edit
  end

  # POST /gravures or /gravures.json
  def create
    @gravure = Gravure.new(gravure_params)

    respond_to do |format|
      if @gravure.save
        format.html { redirect_to schedules_path, notice: "Gravure was successfully created." }
        format.json { render :show, status: :created, location: @gravure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gravure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gravures/1 or /gravures/1.json
  def update
    respond_to do |format|
      if @gravure.update(gravure_params)
        format.html { redirect_to schedules_path, notice: "Gravure was successfully updated." }
        format.json { render :show, status: :ok, location: @gravure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gravure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gravures/1 or /gravures/1.json
  def destroy
    @gravure.destroy!

    respond_to do |format|
      format.html { redirect_to gravures_url, notice: "Gravure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gravure
      @gravure = Gravure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gravure_params
      params.require(:gravure).permit(:date, :time, :high, :low)
    end
end
