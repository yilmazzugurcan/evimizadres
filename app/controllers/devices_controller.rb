class DevicesController < ApplicationController
    
  
  
    def index
      @devices = Device.all
      respond_to do |format|
        format.html
        format.json { render json: @devices }
      end
    end
  
  
    def new
    end
  
    def create
      data = {
        device_type: params[:device_type],
        identifier: params[:identifier],
        region_name: params[:region_name],
        city_name: params[:city_name],
        district_name: params[:district_name], 
        street_name: params[:street_name],
        entry_num: params[:entry_num],
        house_num: params[:house_num]
      }.to_json
    
      response = HTTParty.post("https://gis.sputnik.systems/api/v1/external/devices/install_device", 
        headers: {
          "Authorization" => "9ba197fc-f641-490f-94a9-e884d15e5907",
          "Content-Type" => "application/json"
        },
        body: data
      )
       
#binding.pry
  
      if response.code == 200
        flash[:notice] = "Cihaz başarıyla eklendi" 
      else
        flash[:alert] = "API'den hata alındı: #{response.code} - #{response.message}"
        Rails.logger.error("API istek hatası: #{response.code} - #{response.message}") 
      end
      
      redirect_to new_device_path
    end
    
  end

  

  
  
  
  