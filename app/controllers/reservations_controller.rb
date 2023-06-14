class ReservationsController < ApplicationController


  def index
    @user = current_user
    @reservations = Reservation.where(user_id: @user.id)
  end

  def confirm
    @user = current_user
    @reservation = Reservation.new(params.require(:reservation).permit(:room_name, :room_introduction, :room_image , :price, :address, :check_in_date, :check_out_date, :number_of_people,:stay_days, :payment_amount, :user_id, :room_id))
    @day = Date.current
    if @reservation.invalid?
      @room = @reservation
      render "rooms/show"
    else
      @reservation.stay_days = (@reservation.check_out_date - @day) - (@reservation.check_in_date - @day).to_i
      @reservation.payment_amount = @reservation.price * @reservation.number_of_people * @reservation.stay_days
    end

  end

  def create
    @user = current_user
    @reservation = Reservation.new(params.require(:reservation).permit(:room_name, :room_introduction, :price, :address, :room_image, :check_in_date, :check_out_date, :number_of_people,:stay_days, :payment_amount, :user_id, :room_id))
    if @reservation.save
      redirect_to "/reservations/index"
    else
      render "confirm"
    end
  end

  def rebook
    @user = current_user
    @reservation = Reservation.find(params[:id])
  end

  def rebook_confirm
    @user = current_user
    @reservation = Reservation.new(params.require(:reservation).permit(:id, :room_name, :room_introduction, :price, :address, :room_image, :check_in_date, :check_out_date, :number_of_people,:stay_days, :payment_amount, :user_id, :room_id))
    @day = Date.current
    if @reservation.invalid?
      @room = @reservation
      render "rebook"
    else
      @reservation.stay_days = (@reservation.check_out_date - @day) - (@reservation.check_in_date - @day).to_i
      @reservation.payment_amount = @reservation.price * @reservation.number_of_people * @reservation.stay_days
    end
  end

  def update
    @user = current_user
    @reservation = Reservation.find(params[:id])
    if @reservation.update(params.require(:reservation).permit(:id, :room_name, :room_introduction, :price, :address, :room_image, :check_in_date, :check_out_date, :number_of_people,:stay_days, :payment_amount, :user_id, :room_id))
      redirect_to reservations_index_path
    else
      render "index"      
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_index_path
  end

end
