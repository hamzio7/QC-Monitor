class StopReasonsController < ApplicationController
  before_action :set_stop_reason, only: [:edit, :update, :destroy]

  def index
    @stop_reasons = StopReason.all
  end

  def new
    @stop_reason = StopReason.new
  end

  def create
    @stop_reason = StopReason.new(stop_reason_params)
    if @stop_reason.save
      redirect_to stop_reasons_path, notice: 'Stop reason created successfully.'
    else
      flash.now[:alert] = 'There was an error creating the stop reason.'
      render :new
    end
  end

  def edit
    # Renders the edit form
  end

  def update
    if @stop_reason.update(stop_reason_params)
      redirect_to stop_reasons_path, notice: 'Stop reason updated successfully.'
    else
      flash.now[:alert] = 'There was an error updating the stop reason.'
      render :edit
    end
  end

  def destroy
    @stop_reason.destroy
    redirect_to stop_reasons_path, notice: 'Stop reason deleted successfully.'
  end

  private

  def set_stop_reason
    @stop_reason = StopReason.find(params[:id])
  end

  def stop_reason_params
    params.require(:stop_reason).permit(:reason, :persian_reason)
  end
end
