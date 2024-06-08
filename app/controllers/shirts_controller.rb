class ShirtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_shirt, only: [:show, :destroy, :edit, :update, :purchase]
  before_action :authorize_user!, only: [:update, :destroy]

  def index
    @shirts = Shirt.all

    # Filtro por query
    @shirts = @shirts.search_by_attributes(params[:query]) if params[:query].present?

    # Filtro por país
    if params[:country].present? && params[:country] != "Todos os Países"
      normalized_country = params[:country].downcase
      if normalized_country == "outros países"
        @shirts = @shirts.where.not("lower(country) IN (?)", ["brasil", "espanha", "inglaterra", "italia"])
      else
        @shirts = @shirts.where("lower(country) = ?", normalized_country)
      end
    end

    # Filtro por tamanho
    if params[:size].present? && params[:size] != "Todos os Tamanhos"
      @shirts = @shirts.where(size: params[:size])
    end

    # Filtro por time
    if params[:team].present? && params[:team] != "Todos os Times"
      if params[:team].downcase == "outros times"
        @shirts = @shirts.where.not("lower(team) IN (?)", ["cruzeiro", "flamengo", "vasco", "corinthians", "barcelona", "real madrid", "manchester", "juventus"])
      else
        @shirts = @shirts.where("lower(team) = ?", params[:team].downcase)
      end
    end

    # Remove camisetas que foram compradas
    @shirts = @shirts.where.not(id: Order.select(:shirt_id))

    # Ordena as camisetas (opcional)
    @shirts = @shirts.order(created_at: :desc)
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
    if params[:shirt][:photos].present?
      @shirt.photos.attach(params[:shirt][:photos])
    end
    if @shirt.update(shirt_params.except(:photos))
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
      redirect_to user_path(current_user.id), notice: 'Purchase was successfully completed.'
    else
      Rails.logger.error "Order creation failed: #{order.errors.full_messages.join(', ')}"
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
