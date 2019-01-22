class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def show
    @house = House.find(params[:id])
    @members = @house.members
  end

  def create
    @house = House.new(house_params)

    if @house.save
      redirect_to @house, notice: 'House added successfully'
    else
      # @error_msg_array = @question.errors.full_messages
      flash[:error] = @house.errors.full_messages
      render :new
    end
  end

  private
  def house_params
    params.require(:house).permit(:name, :source, :author, :motto)
  end
end



edit

update

delete
