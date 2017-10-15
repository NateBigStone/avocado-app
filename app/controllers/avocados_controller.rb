class AvocadosController < ApplicationController
  def index
    sort_attribute = params[:sort]
    order_attribute = params[:order]
    if sort_attribute
      @avocados = Avocado.all.where("user_id = ?", sort_attribute).order("created_at" => "desc")
    else
      @avocados= Avocado.all.order("created_at" => "desc")
    end  

  end
  def new
    @locations = Location.all

  end
  def create
    if params[:category] == "Medium Hass"
      avo_math = (params[:price].to_f / 7.4).round(2)
    elsif params[:category] == "Small Hass"
      avo_math = (params[:price].to_f / 5.2).round(2)
    elsif params[:category] == "Tiny Hass"
      avo_math = (params[:price].to_f / 2.7).round(2)
    end
    unless params[:location_id] == ""
      use_location = params[:location_id]
      else
        location = Location.new(
                                name: params[:name],
                                address: params[:address],
                                lat: params[:lat],
                                lng: params[:lng]
                              )
        location.save
        use_location = location.id
      end
    avocado = Avocado.new(
                         user_id: current_user.id,
                         location_id: use_location,
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
  def map
    @locations = Location.all
  end
end
