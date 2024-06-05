class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:checkout]
  before_action :set_shirt, only: [:checkout]

  def checkout
    if @shirt.present?
      @order = Order.new(shirt: @shirt, total_price: @shirt.price)
      if @order.save
        flash[:success] = "Pedido criado com sucesso!"
        redirect_to root_path
      else
        flash[:error] = "Erro ao criar pedido"
        render :checkout
      end
    else
      flash[:error] = "Camiseta não encontrada"
      redirect_to root_path
    end
  end

  private

  def set_shirt
    @shirt = Shirt.find_by(id: params[:shirt_id])
  end
end
