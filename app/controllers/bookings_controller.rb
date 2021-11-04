class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]

  def create
    @booking = Booking.new(params_booking)
    @booking.room_id = params[:room_id]
    @booking.user = current_user
    authorize @booking
    respond_to do |format|
      if @booking.save
        format.html { redirect_to profile_path(current_user), notice: "Your booking was saved" }
      end
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    respond_to do |format| 
      if @booking.update(params_booking)
        format.html { redirect_to profile_path(current_user)}
      end
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end
end
