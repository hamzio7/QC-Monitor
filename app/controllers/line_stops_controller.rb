class LineStopsController < ApplicationController
  before_action :set_line_stop, only: %i[ show edit update destroy ]

  # GET /line_stops or /line_stops.json
  def index
    @line_stops = LineStop.all
  end

  # GET /line_stops/1 or /line_stops/1.json
  def show
  end

  # GET /line_stops/new
  def new
    @line_stop = LineStop.new
  end

  # GET /line_stops/1/edit
  def edit
  end

  # POST /line_stops or /line_stops.json
  def create

    production_day = ProductionDay.find_or_create_by(production_date: line_stop_params[:date]) do |pd|
      pd.info = ""
    end

    @line_stop = LineStop.new(line_stop_params)
    @line_stop.production_day = production_day

    respond_to do |format|
      if @line_stop.save
        format.html { redirect_to line_stop_url(@line_stop), notice: "Line stop was successfully created." }
        format.json { render :show, status: :created, location: @line_stop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_stops/1 or /line_stops/1.json
  def update
    respond_to do |format|
      if @line_stop.update(line_stop_params)
        format.html { redirect_to line_stop_url(@line_stop), notice: "Line stop was successfully updated." }
        format.json { render :show, status: :ok, location: @line_stop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_stops/1 or /line_stops/1.json
  def destroy
    @line_stop.destroy!

    respond_to do |format|
      format.html { redirect_to line_stops_url, notice: "Line stop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_stop
      @line_stop = LineStop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_stop_params
      params.require(:line_stop).permit(:date, :line_number, :time_stopped, :time_restarted, :reason, :shift)
    end
end
