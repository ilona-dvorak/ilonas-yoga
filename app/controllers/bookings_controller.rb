class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  before_action :set_yogaclass_id, only: [:show, :new, :create]

  def index
    @user = current_user
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @user = current_user
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new
    authorize @booking
    @booking.yogaclass = @yogaclass

    @user = current_user
    @booking.user = @user

    if @booking.save
      redirect_to yogaclass_booking_path(@yogaclass, @booking)
    else
      render :new
    end
  end

  def destroy
    @yogaclass = @booking.yogaclass
    @booking.destroy
    redirect_to "/yogaclasses/:yogaclass_id/bookings"
  end

  private

  def set_yogaclass_id
    @yogaclass = Yogaclass.find(params[:yogaclass_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
