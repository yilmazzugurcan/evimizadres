

class SessionsController < ApplicationController
  

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_citizen_path, notice: 'Giriş başarılı!'
    else
      flash.now[:alert] = 'Kullanıcı adı veya şifre hatalı.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Çıkış yapıldı.'
  end
end
