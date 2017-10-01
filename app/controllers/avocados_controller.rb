class AvocadosController < ApplicationController

  def index
    @avocados = Avocado.all
    @message = "sup?"
  end

  def new
  end

  def create
    avocado = Avocado.new(
                         user_id: 1,
                         location_id: 1,
                         price: params[:price],
                         ripeness: params[:ripeness],
                         spoiled_on: nil,
                         notes: params[:notes],
                         category: params[:category],
                         organic: params[:organic]
                        )
    avocado.save
    redirect_to "/avocados/#{avocado.id}"
  end
  def show
    @avocado = Avocado.find_by(id: params[:id])
  end
end
