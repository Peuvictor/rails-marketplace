class ShirtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_shirt, only: [:show, :destroy, :edit, :update, :purchase]
  before_action :authorize_user!, only: [:update, :destroy]

  def index
    if params[:query].present?
      @shirts = Shirt.search_by_attributes(params[:query])
    else
      @shirts = Shirt.all
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
    # Atualizar ou excluir os registros dependentes
    @shirt.orders.update_all(shirt_id: nil) # ou você pode excluir os registros relacionados
    @shirt.destroy
    redirect_to root_path, notice: 'Shirt was successfully purchased .', status: :see_other
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
