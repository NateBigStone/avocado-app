class AvocadosController < ApplicationController
  def index
    filter_attribute = params[:filter]
    filter_by = params[:filter_by]
    if filter_by == "user"
      @avocados = Avocado.all.where("user_id = ?", filter_attribute).order("created_at" => "desc")
    elsif filter_by == "location"
      @avocados = Avocado.all.where("location_id = ?", filter_attribute).order("created_at" => "desc")
    else
      @avocados= Avocado.all.order("created_at" => "desc")
    end  
  end
  def new
    redirect_to "/login" unless current_user
    @client = GooglePlaces::Client.new(ENV["maps_api"])
    @locations = Location.all.order("name" => "asc")
  end
  def create
    if params[:category] == "Jumbo Hass"
      avo_math = (params[:price].to_f / 12.2).round(2)
    elsif params[:category] == "Large Hass"
      avo_math = (params[:price].to_f / 9.8).round(2)
    elsif params[:category] == "Medium Hass"
      avo_math = (params[:price].to_f / 7.4).round(2)
    elsif params[:category] == "Small Hass"
      avo_math = (params[:price].to_f / 5.2).round(2)
    elsif params[:category] == "Tiny Hass"
      avo_math = (params[:price].to_f / 3.1).round(2)
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
  def show_all
    @locations = Location.all
    filter_attribute = params[:filter]
    filter_by = params[:filter_by]
    order_attribute = params[:order]
    page = params[:page]
    if filter_by == "unit_price"
      @avocados = Avocado.all.where("#{filter_by} > ?", filter_attribute).order("unit_price" => "asc").paginate(page: params[:page], per_page: 5)
    elsif filter_by == "ripeness"
      @avocados = Avocado.all.order(filter_by => filter_attribute).paginate(page: params[:page], per_page: 5)
    elsif filter_by
      @avocados = Avocado.all.where("#{filter_by} = ?", filter_attribute).order("created_at" => "desc").paginate(page: params[:page], per_page: 5)
    else
      @avocados= Avocado.all.order("created_at" => "desc").paginate(page: params[:page], per_page: 5)
    end
  end
  def map
    @locations = Location.all
  end
end
