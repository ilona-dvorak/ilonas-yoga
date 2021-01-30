class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @user = current_user
    @bookings = @user.bookings
  end

  def show
  end

  def new
    @yogaclass = Yogaclass.find(params[:yogaclass_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new

    @yogaclass = Yogaclass.find(params[:yogaclass_id])
    @booking.yogaclass = @yogaclass

    @user = current_user
    @booking.user = @user

    if @booking.save
      redirect_to yogaclass_path(@yogaclass)
    else
      render :new
    end
  end

  def destroy
    @yogaclass = @booking.yogaclass
    @booking.destroy
    redirect_to yogaclass_path(@yogaclass)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
