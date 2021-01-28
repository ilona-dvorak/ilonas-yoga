class YogaclassesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @yogaclasses = Yogaclass.all
  end

  def new
    @yogaclass = Yogaclass.new
  end

  def show
    @yogaclass = Yogaclass.find(params[:id])
  end

  def create
    @user = current_user
    @yogaclass = Yogaclass.new(yogaclass_params)
    @yogaclass.user = @user
    if @yogaclass.save
      redirect_to yogaclass_path(@yogaclass)
    else
      render :new
    end
  end

  private

  def yogaclass_params
    params.require(:yogaclass).permit(:price, :class_type, :address, :start_at, :duration, :title)
  end
end
