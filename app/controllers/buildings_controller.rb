class BuildingsController < ApplicationController
  before_action :set_building, only: %i[ show edit update destroy ]

  def index
    @buildings = Building.all.includes(cover_image_attachment: :blob)
    @best_match_buildings = @buildings.sample(3)
  end

  def show
    @available_apartments = @building.apartments.includes(image_attachment: :blob).available
    @building_policies = @building.building_policies.includes(:policy)
  end

  def new
    @building = Building.new
  end

  def edit
  end

  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to building_url(@building), notice: "Building was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to building_url(@building), notice: "Building was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @building.destroy

    respond_to do |format|
      format.html { redirect_to buildings_url, notice: "Building was successfully destroyed." }
    end
  end

  private
    def set_building
      @building = Building.find(params[:id])
    end

    def building_params
      params.require(:building).permit(:name, :address, :lat, :long)
    end
end
