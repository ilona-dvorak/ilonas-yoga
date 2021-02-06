class YogaclassesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_yogaclass, only: [:show, :destroy, :edit, :update]
  before_action :set_user, only: [:index, :new, :show, :edit, :update]

  def index
    @yogaclasses = policy_scope(Yogaclass).order(created_at: :desc)

    @markers = @yogaclasses.geocoded.map do |yogaclass|
      {
        lat: yogaclass.latitude,
        lng: yogaclass.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { yogaclass: yogaclass })
      }
    end

    if params[:query].present?
      @yogaclasses = Yogaclass.global_search(params[:query])
    else
      @yogaclasses = Yogaclass.all
    end
  end

  def new
    @yogaclass = Yogaclass.new
    authorize @yogaclass
  end

  def show
    @bookings = @yogaclass.bookings
    @booking = Booking.new

    @markers = [{
      lat: @yogaclass.latitude,
      lng: @yogaclass.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { yogaclass: @yogaclass })
    }]
  end

  def create
    @yogaclass = Yogaclass.new(yogaclass_params)
    @yogaclass.user = current_user
    authorize @yogaclass
    if @yogaclass.save
      redirect_to yogaclass_path(@yogaclass)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @yogaclass.update(yogaclass_params)
    redirect_to yogaclass_path(@yogaclass)
  end

  def destroy
    @yogaclass.destroy
    redirect_to yogaclasses_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_yogaclass
    @yogaclass = Yogaclass.find(params[:id])
    authorize @yogaclass
  end

  def yogaclass_params
    params.require(:yogaclass).permit(:price, :class_type, :address, :start_at, :duration, :title, :photo, :description)
  end
end
