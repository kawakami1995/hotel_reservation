class RoomsController < ApplicationController
  def index
    @user = current_user
    @rooms = Room.where(user_id: @user.id)
  end

  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :price, :address, :room_image, :user_id))
    if @room.save
      redirect_to "/rooms/index"
    else
      render "new"
    end
  end

  def edit
    @user = current_user
    @room = Room.find(params[:id])
  end 

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new()
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to "/rooms/index"
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name, :room_introduction, :price, :address, :room_image))
      redirect_to "/rooms/index"
    else
      render "edit"      
    end
  end

  def search
    @user = current_user
    @rooms = Room.where("address like ?", "%#{params[:area_name]}%").where("room_name like ? or room_introduction like ?", "%#{params[:keyword]}%","%#{params[:keyword]}%")
    @count = @rooms.count
  end

end
