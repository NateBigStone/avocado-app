class AvocadosController < ApplicationController
  def index
    sort_attribute = params[:sort]
    order_attribute = params[:order]
    @avocados = Avocado.order("created_at" => "desc")
  end
  def new
  end
  def create
    if params[:category] == "Medium Hass"
      avo_math = (params[:price].to_f / 7.4).round(2)
    elsif params[:category] == "Small Hass"
      avo_math = (params[:price].to_f / 5.2).round(2)
    end
    avocado = Avocado.new(
                         user_id: current_user.id,
                         location_id: 1,
                         price: params[:price],
                         ripeness: params[:ripeness],
                         spoiled_on: nil,
                         notes: params[:notes],
                         category: params[:category],
                         organic: params[:organic],
                         unit_price: avo_math
                        )
    avocado.save
    redirect_to "/avocados/#{avocado.id}"
  end
  def show
    @avocado = Avocado.find_by(id: params[:id])
  end
end
