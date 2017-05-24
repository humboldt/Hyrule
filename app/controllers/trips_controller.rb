class TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
      @trips = current_user.trips
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @days = @trip.days
  end

  # GET /trips/new
  def new
    @trip = current_user.trips.build
    @trip.build_budget
    @trip.build_rythme
    @trip.build_style
    @trip.build_hotel
    @trip.build_resto
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = current_user.trips.build(trip_params)
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:name, :price, :description,
                                    budget_attributes: [:id, :value, :comment],
                                    rythme_attributes: [:id, :value, :comment],
                                    style_attributes:  [:id, :culture, :nature, :sport, :food, :shopping, :kid, :comment],
                                    hotel_attributes:  [:id, :todo, :hotel_type, :comment],
                                    resto_attributes:  [:id, :lunch_todo, :lunch_type, :dinner_todo, :dinner_type, :comment]
                                    )
    end
end
