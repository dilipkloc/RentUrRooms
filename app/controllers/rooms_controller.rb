class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @hash = Gmaps4rails.build_markers(@room) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.images = params['room']['images']
    @results = Geocoder.search(@room.address+', '+City.find(@room.city_id).name);
    
    @room.latitude = @results.first.coordinates.first;
    @room.longitude = @results.first.coordinates.last;

    @room.user_id = current_user.id

    respond_to do |format|
      if @room.save

        if User.find(current_user.id).role_id != Role.find_by(name: 'host').id

          @user = User.find(current_user.id)
          @user.role_id = Role.find_by(name: 'host').id
          if @user.save
            format.html { redirect_to @room, notice: 'Room was successfully created.' }
            format.json { render :show, status: :created, location: @room }
          else
            redirect_to errors_path
          end
        else
          format.html { redirect_to @room, notice: 'Room was successfully created.' }
          format.json { render :show, status: :created, location: @room }
        end

      else
        redirect_to errors_path
        # format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :description, :price, :rules, :address, :latitude, :longitude, :city_id, :user_id)
    end
end
