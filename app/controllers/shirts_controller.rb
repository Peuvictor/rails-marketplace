class ShirtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_shirt, only: [:show]

  def index
    @shirts = Shirt.all
  end

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shirt
    @shirt = Shirt.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def shirt_params
    params.require(:shirt).permit(:name, :price, :description)
  end
end
