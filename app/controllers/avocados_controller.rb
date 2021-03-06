class AvocadosController < ApplicationController
  HEADERS = {"Ocp-Apim-Subscription-Key" => ENV['news_api'], "Accept" => "application/json", 
      "User-Agent" => "Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 822)", 
      "X-Search-ClientIP" => "999.999.999.999", 
      "Host" => "api.cognitive.microsoft.com"}
  def index
    @avocados= Avocado.all.order("spotted" => "desc")
    @news = Unirest.get('https://api.cognitive.microsoft.com/bing/v7.0/news/search?q=avocado&mkt=en-us', headers: HEADERS).body
    val = 0
    while @news['value'][val].dig('image') == nil
      val += 1
    end
    @news_1 = @news['value'][val]
    val += 1
    while @news['value'][val].dig('image') == nil
      val += 1
    end
    @news_2 = @news['value'][val]
    val += 1
    while @news['value'][val].dig('image') == nil
      val += 1
    end
    @news_3 = @news['value'][val]
  end
  def new
    redirect_to "/login" unless current_user
  end
  def create
    locations = Location.all
    found_location = locations.find_by(address: params[:address])
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
    added = Time.now
    will_spoil = (10 - params[:ripeness].to_i) * 1.5
    if found_location
      use_location = found_location.id
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
                         notes: params[:notes],
                         category: params[:category],
                         organic: params[:organic],
                         unit_price: avo_math,
                         spotted: added,
                         spoiled_on: added + will_spoil.days
                        )
    avocado.save
    redirect_to "/avocados/show_all/1"
  end
  def show
    @avocado = Avocado.find_by(id: params[:id])
  end
  def redirect
    redirect_to "/avocados/show_all/1"
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
      @avocados = Avocado.all.where("#{filter_by} = ?", filter_attribute).order("spotted" => "desc").paginate(page: params[:page], per_page: 5)
    else
      @avocados= Avocado.all.order("spotted" => "desc").paginate(page: params[:page], per_page: 5)
    end
  end
  def json
    @avocados = Avocado.all
    @locations = Location.all
    render json: @avocados, :include => {:location => {:except => [:created_at, :updated_at]}}, :except => [:user_id, :notes, :spoiled_on]
  end
  def charts
  end
  def search
    @avocados = Avocado.all
    url = "http://www.supermarketapi.com/api.asmx/SearchByProductName?APIKEY=#{ENV['supermarket_api']}&ItemName=avocado"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @xml_doc  = Nokogiri::XML(response.body)
    #product = xml_doc.xpath("//Product").text #replace the tagname with the desired content
  end
  def map
    @locations = Location.all
  end
end
