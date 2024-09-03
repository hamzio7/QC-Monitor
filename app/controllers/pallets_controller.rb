class PalletsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_pallet, only: %i[ show edit update destroy print]
  before_action :get_tanks, only: %i[ edit new show create ]

  # GET /pallets or /pallets.json
  def index
    if params[:query].present?
      @pallets = Pallet.where("pallet_number LIKE ? OR supervisor LIKE ? OR production_date LIKE ? OR customer LIKE ? OR status LIKE ? OR color_number LIKE ?",

                              "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @pallets = Pallet.all.sort_by(&:production_date).reverse
    end
  end

  # GET /pallets/1 or /pallets/1.json
  def show

  end

  # GET /pallets/new
  def new
    @pallet = Pallet.new
  end

  def print
    render :print
  end

  # GET /pallets/1/edit
  def edit

  end

  # POST /pallets or /pallets.json
  def create
    production_day = ProductionDay.find_or_create_by(production_date: pallet_params[:production_date]) do |pd|
      pd.info = ""
    end

    @pallet = Pallet.new(pallet_params)
    @pallet.production_day = production_day

    respond_to do |format|
      if @pallet.save
        format.html { redirect_to pallet_url(@pallet), notice: "Pallet was successfully created." }
        format.json { render :show, status: :created, location: @pallet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pallet.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /pallets/1 or /pallets/1.json
  def update
    respond_to do |format|
      if @pallet.update(pallet_params)
        format.html { redirect_to pallet_url(@pallet), notice: "Pallet was successfully updated." }
        format.json { render :show, status: :ok, location: @pallet }
        @pallet.production_day.update_pallet_counts
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pallets/1 or /pallets/1.json
  def destroy
    @pallet.destroy!

    respond_to do |format|
      format.html { redirect_to pallets_url, notice: "Pallet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def get_tanks
    @uf_tanks = UfTank.order(created_at: :desc).limit(5)
    @mf_tanks = MfTank.order(created_at: :desc).limit(5)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_pallet
    @pallet = Pallet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pallet_params
    params.require(:pallet).permit(:final_date, :press_quality,:pallet_quality, :finish, :actions_taken, :dimensions, :shift, :pallet_number, :line_speed, :production_date, :production_day, :production_time, :color_number, :quantity, :customer, :initial_grammage, :final_grammage_min, :final_grammage_max, :cloudy_time, :gel_time, :grammage_min_set, :grammage_max_set, :uf_tank_id, :mf_tank_id, :volatile_content_set_min, :volatile_content_set_max, :volatile_content_min, :volatile_content_max, :glossiness, :supervisor, :status, :stop_reason, :info, :final_supervisor, :final_status, :final_stop_reason, :final_info)
  end
end
