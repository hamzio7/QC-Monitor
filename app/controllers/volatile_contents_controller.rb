class VolatileContentsController < ApplicationController
  before_action :set_volatile_content, only: %i[ show edit update destroy ]

  # GET /volatile_contents or /volatile_contents.json
  def index
    @volatile_contents = VolatileContent.all
  end

  # GET /volatile_contents/1 or /volatile_contents/1.json
  def show
  end

  # GET /volatile_contents/new
  def new
    @volatile_content = VolatileContent.new
  end

  # GET /volatile_contents/1/edit
  def edit
  end

  # POST /volatile_contents or /volatile_contents.json
  def create
    @volatile_content = VolatileContent.new(volatile_content_params)

    respond_to do |format|
      if @volatile_content.save
        format.html { redirect_to volatile_content_url(@volatile_content), notice: "Volatile content was successfully created." }
        format.json { render :show, status: :created, location: @volatile_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @volatile_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volatile_contents/1 or /volatile_contents/1.json
  def update
    respond_to do |format|
      if @volatile_content.update(volatile_content_params)
        format.html { redirect_to volatile_content_url(@volatile_content), notice: "Volatile content was successfully updated." }
        format.json { render :show, status: :ok, location: @volatile_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @volatile_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volatile_contents/1 or /volatile_contents/1.json
  def destroy
    @volatile_content.destroy!

    respond_to do |format|
      format.html { redirect_to volatile_contents_url, notice: "Volatile content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volatile_content
      @volatile_content = VolatileContent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def volatile_content_params
      params.require(:volatile_content).permit(:min, :max, :time, :date)
    end
end
