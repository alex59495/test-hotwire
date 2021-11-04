class RoomsController < ApplicationController
  before_action :find_room, only: [:show, :destroy, :edit, :update]
  
  def index
    @rooms = policy_scope(Room).order(created_at: :desc)
  end

  def show
    authorize @room
    @booking = Booking.new
  end
  
  def new
    @room = Room.new
    authorize @room
  end

  def edit
    authorize @room
  end

  def create
    @room = Room.new(params_room)
    @room.user = current_user
    authorize @room
    binding.pry

    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path }
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('rooms', @room, locals: { current_user: current_user, room: @room }) }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@room, partial: 'rooms/form', locals: { room: @room }) }
      end
    end
  end


  def update
    authorize @room
    respond_to do |format|
      if @room.update(params_room)
        format.turbo_stream { render turbo_stream: turbo_stream.update(@room, partial: 'rooms/room', locals: { room: @room })}
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@room, partial: 'rooms/form', locals: { room: @room }) }
      end
    end
  end

  def destroy
    authorize @room
    @room.destroy
  end

  private

  def params_room
    params.require(:room).permit(:beds, :name, :accomodation_type)
  end

  def find_room
    @room = Room.find(params[:id])
  end
end
