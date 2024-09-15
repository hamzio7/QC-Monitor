class PalletsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_pallet, only: %i[show edit update destroy print]
  before_action :get_tanks, only: %i[edit new show create]
  before_action :get_stop_reasons, only: %i[new edit create update]

  def index
    if params[:pallet].present?
      @pallets = Pallet.where("pallet_number LIKE :query OR supervisor LIKE :query OR production_date LIKE :query OR customer LIKE :query OR status LIKE :query OR color_number LIKE :query", query: "%#{params[:pallet]}%")
                       .order(production_date: :desc)
                       .page(params[:page]).per(10)
    else
      @pallets = Pallet.order(production_date: :desc).page(params[:page]).per(10)
    end
  end

  def show
    @stop_reasons = @pallet.stop_reasons
  end

  def new
    @pallet = Pallet.new
  end

  def print
    render :print
  end

  def edit; end

  def create




    production_day = find_or_create_production_day(pallet_params[:production_date])
    stop_reason_ids = process_stop_reasons

    @pallet = Pallet.new(pallet_params)
    @pallet.stop_reasons = StopReason.where(id: stop_reason_ids)
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

  def update
    stop_reason_ids = process_stop_reasons

    respond_to do |format|
      if @pallet.update(pallet_params.merge(stop_reason_ids: stop_reason_ids))
        format.html { redirect_to pallet_url(@pallet), notice: "Pallet was successfully updated." }
        format.json { render :show, status: :ok, location: @pallet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pallet.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def set_pallet
    @pallet = Pallet.find(params[:id])
  end

  def get_stop_reasons
    @stop_reasons = StopReason.all
  end

  def pallet_params
    params.require(:pallet).permit(
      :line_speed, :pallet_number, :color_number, :shift, :production_date,
      :production_time, :dimensions, :quantity, :finish, :customer,
      :initial_grammage, :grammage_min_set, :grammage_max_set,
      :final_grammage_min, :final_grammage_max, :uf_tank_id, :mf_tank_id,
      :cloudy_time, :gel_time, :volatile_content_set_min, :volatile_content_set_max,
      :volatile_content_min, :volatile_content_max, :glossiness, :press_quality,
      :pallet_quality, :supervisor, :status, :info, :final_supervisor, :final_status,
      :final_stop_reason, :final_info, stop_reason_ids: [], custom_stop_reasons: []
    )
  end

  def find_or_create_production_day(production_date)
    ProductionDay.find_or_create_by(production_date: production_date) { |pd| pd.info = "" }
  end

  def process_stop_reasons
    stop_reason_ids = params[:pallet][:stop_reason_ids].to_a.map(&:to_i)
    custom_stop_reasons = params[:pallet][:custom_stop_reasons].to_s.strip

    if custom_stop_reasons.present?
      custom_stop_reasons.split(',').each do |reason|
        stop_reason = StopReason.find_or_create_by(reason: reason.strip)
        stop_reason_ids << stop_reason.id
      end
    end

    stop_reason_ids
  end
end
