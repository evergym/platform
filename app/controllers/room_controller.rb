class RoomController < ApplicationController
  before_action :set_room, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end
  
  def show
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def amenities
  end

  def location
  end

  def update
    if @room.update(new_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end
  
  private
    def set_room
      @room = Room.find(params[:id])
    end
  
    def room_params
      params.require(:room).permit(:room_type, :listing_name, :summary, :address, :is_internet, :is_lounge, :is_pool, :is_shower, :is_towel, :is_yoga, :is_cycling, :is_pilates, :is_basketball, :is_childcare, :is_weights, :is_boxing, :price, :active, :instant)
    end
end