class ShirtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_shirt, only: [:show, :destroy]

  def index
    @shirts = Shirt.all
  end

  def show
  end

  def new
    @shirt = Shirt.new
  end

  def edit; end

  def create
    @shirt = Shirt.new(shirt_params)
    @shirt.user_id = current_user.id
    if @shirt.save
      redirect_to shirts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @shirt.update(shirt_params)
      redirect_to shirts_path, notice: 'shirt was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shirt.destroy!
    redirect_to shirts_path, notice: 'shirt was successfully destroyed.', status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shirt
    @shirt = Shirt.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def shirt_params
    params.require(:shirt).permit(:name, :price, :description, :country, :year, :team, :size, :color, :user_id)
  end
end

