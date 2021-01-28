class YogaclassesController < ApplicationController
  def index
    @yogaclasses = Yogaclass.all
  end

  def new
    @yogaclass = Yogaclass.new
  end

  def create
    @user = current_user
    @yogaclass = Yogaclass.new(yogaclass_params)
    @yogaclass.user = @user
    if @yogaclass.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def yogaclass_params
    params.require(:yogaclass).permit(:price, :class_type, :address, :start_at, :duration, :title)
  end
end
