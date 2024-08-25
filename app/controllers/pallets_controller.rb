class PalletsController < ApplicationController
  before_action :set_pallet, only: %i[ show edit update destroy ]
  before_action :get_tanks, only: %i[ edit new ]

  # GET /pallets or /pallets.json
  def index
    if params[:query].present?
      @pallets = Pallet.where("pallet_number LIKE ? OR supervisor LIKE ? OR customer LIKE ? OR status LIKE ? OR color_number LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @pallets = Pallet.all
    end
  end

  # GET /pallets/1 or /pallets/1.json
  def show

  end

  # GET /pallets/new
  def new
    @pallet = Pallet.new
  end

  # GET /pallets/1/edit
  def edit

  end

  # POST /pallets or /pallets.json
  def create
    @pallet = Pallet.new(pallet_params)
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
    params.require(:pallet).permit(:pallet_number, :production_date, :production_time, :color_number, :quantity, :customer, :initial_grammage, :final_grammage_min, :final_grammage_max, :cloudy_time, :gel_time, :grammage_min_set, :grammage_max_set, :uf_tank_id, :mf_tank_id, :volatile_content_set_min, :volatile_content_set_max, :volatile_content_min, :volatile_content_max, :glossiness, :supervisor, :status, :stop_reason, :info, :final_supervisor, :final_status, :final_stop_reason, :final_info)
  end
end
