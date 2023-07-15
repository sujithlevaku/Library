class LibraryZonesController < ApplicationController
  before_action :set_library_zone, only: %i[ show edit update destroy ]

  # GET /library_zones or /library_zones.json
  def index
    @library_zones = LibraryZone.all
  end

  # GET /library_zones/1 or /library_zones/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @library_zone, only: [:id, :name], include: { books: { only: [:id, :title, :author, :status, :checked_out_by] } } }
    end
  end


  # GET /library_zones/new
  def new
    @library_zone = LibraryZone.new
  end

  # GET /library_zones/1/edit
  def edit
  end

  # POST /library_zones or /library_zones.json
  def create
    @library_zone = LibraryZone.new(library_zone_params)

    respond_to do |format|
      if @library_zone.save
        format.html { redirect_to library_zone_url(@library_zone), notice: "Library zone was successfully created." }
        format.json { render :show, status: :created, location: @library_zone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @library_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /library_zones/1 or /library_zones/1.json
  def update
    respond_to do |format|
      if @library_zone.update(library_zone_params)
        format.html { redirect_to library_zone_url(@library_zone), notice: "Library zone was successfully updated." }
        format.json { render :show, status: :ok, location: @library_zone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @library_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_zones/1 or /library_zones/1.json
  def destroy
    @library_zone.destroy

    respond_to do |format|
      format.html { redirect_to library_zones_url, notice: "Library zone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library_zone
      @library_zone = LibraryZone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_zone_params
      params.require(:library_zone).permit(:name)
    end
end
