class CitizensController < ApplicationController

    def index
      @Citizen = Citizen.all
    end


  
  def create
    # Formdan gelen verileri alın
    phone = params[:phone]
    intercom_uuid = params[:intercom_uuid]
    first_name = params[:first_name]

    # API adresine POST isteği gönderin (string interpolation ile phone dahil ediliyor)
    
    response = HTTParty.post("https://api-mobile-gorod.sputnik.systems/api/admin/evimiz/citizens/#{phone}/activate",
            body: {
        phone: phone,
        intercom_uuid: intercom_uuid,
        first_name: first_name
            }.to_json,           
      headers: {
        "Authorization"=>"KAPMgP8ipx8MoYzoM1LHz1z5UVUBRA0q",
        "Content-Type"=>"application/json"
      }
    )
    
    binding.pry
    # API yanıtını işleyin (örneğin, yanıtı görüntüleyin)
    if response.code == 200
      flash[:notice] = "Numara başarıyla eklendi" 
    else
      flash[:alert] = "API'den hata alındı: #{response.code} - #{response.message}"
      Rails.logger.error("API istek hatası: #{response.code} - #{response.message}") 
    end  
    # İsteği işledikten sonra kullanıcıyı başka bir sayfaya yönlendirin veya yanıtı görüntüleyin
    redirect_to new_citizen_path
  end

  #def edit
   ## @citizen = Citizen.find(params[:id])
   # @devices = Device.all
  #end
#def update
  #@citizen = Citizen.find(params[:id])
   # phone = params[:citizen][:phone]
   # intercom_uuid = params[:citizen][:intercom_uuid]
   # first_name = params[:citizen][:first_name]
   # device_id = params[:citizen][:device_id]

   # response = HTTParty.put("https://api-mobile-gorod.sputnik.systems/api/admin/evimiz/citizens/#{phone}",
      #      body: {
      #  phone: phone,
     #   intercom_uuid: intercom_uuid,
     #   first_name: first_name,
        
     #       }.to_json,           
    #  headers: {
    #    "Authorization"=>"KAPMgP8ipx8MoYzoM1LHz1z5UVUBRA0q",
    #    "Content-Type"=>"application/json"
    #  }
   # )

   # if response.code == 200
    #  flash[:notice] = "Numara başarıyla güncellendi"
  #  else
    #  flash[:alert] = "Numara güncellenirken bir hata oluştu"
    #end
    #redirect_to new_citizen_path
  #end

  #def citizen_params
   # params.require(:citizen).permit(:phone, :intercom_uuid, :first_name, :device_id)
  #end
end
