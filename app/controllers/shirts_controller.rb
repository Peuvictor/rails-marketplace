class ShirtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_shirt, only: [:show, :destroy, :edit, :update, :purchase]
  before_action :authorize_user!, only: [:update, :destroy]

  def index
    @shirts = if params[:query].present?
                Shirt.search_by_attributes(params[:query])
              else
                Shirt.all
              end

    if params[:country].present?
      normalized_country = params[:country].downcase
      if normalized_country == "brasil"
        @shirts = @shirts.where("lower(country) = ?", normalized_country)
      elsif normalized_country == "other countries"
        @shirts = @shirts.where("lower(country) != ?", "brasil")
      end
    end
  end

  def show
  end

  def new
    @shirt = Shirt.new
  end

  def edit
  end

  def create
    @shirt = Shirt.new(shirt_params)
    @shirt.user_id = current_user.id
    if @shirt.save
      redirect_to shirts_path, notice: 'Shirt was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @shirt.update(shirt_params)
      redirect_to shirts_path, notice: 'Shirt was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shirt.destroy
    redirect_to shirts_path, notice: 'Shirt was successfully destroyed.', status: :see_other
  end

  def purchase
    @order = Order.new(shirt: @shirt, user: current_user, payment_method: params[:payment_method], acquisition_date: Time.now)
    if @order.save
      # Exclui os pedidos relacionados
      Order.where(shirt_id: @shirt.id).delete_all
      @shirt.destroy
      redirect_to user_path(current_user), notice: 'Purchase was successfully completed.'
    else
      Rails.logger.error "Order creation failed: #{@order.errors.full_messages.join(', ')}"
      redirect_to shirt_path(@shirt), alert: 'Error completing purchase.'
    end
  end

  private

  def set_shirt
    @shirt = Shirt.find(params[:id])
  end

  def shirt_params
    params.require(:shirt).permit(:name, :price, :description, :country, :year, :team, :size, :color, :user_id, photos: [])
  end

  def authorize_user!
    unless @shirt.user_id == current_user.id
      redirect_to shirts_path, alert: 'You are not authorized to perform this action.', status: :forbidden
    end
  end
end
