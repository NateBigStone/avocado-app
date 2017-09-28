class AvocadosController < ApplicationController

  def index
  end

  def new
  end

  def create
    avocado = Avocado.new(
                         user_id: 1,
                         location_id: 1,
                         type: params[:type],
                         price: params[:price],
                         ripeness: params[:ripeness],
                         spoiled_on: nil,
                         notes: params[:notes]
                        )
    avocado.save
    redirect_to "/avocado/#{avocado.id}"
  end
  def show
    @avocado = Avocado.find_by(id: params[:id])
  end
end
