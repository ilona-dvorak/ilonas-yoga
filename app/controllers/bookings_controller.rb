class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @yogaclass = Yogaclass.find(params[:yogaclass_id])
  end

  def create
    @user = current_user
    @yogaclass = Yogaclass.find(params[:yogaclass_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.yogaclass = @yogaclass
    if @booking.save
      redirect_to root
    else
      render :new
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit()
  end
end
