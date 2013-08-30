# encoding: utf-8

class RequestsController < ApplicationController
   
  def index
    if signed_in?
      @requests = Request.paginate(page: params[:page], :per_page => 10).order("created_at DESC").where(user_id: current_user)

      if current_user.admin? || current_user.manager?
      @requests = Request.paginate(page: params[:page], :per_page => 10).order("created_at DESC")
      end
    end
  end


  def new
    @request = Request.new
  end

  def create
 
    @request = current_user.requests.build(params[:request])
    if @request.save

      require 'net/http'

      @phone = current_user.phone
      @name = current_user.agent.name

       t = User.where('admin = ? OR manager = ?', true, true).select("phone").map(&:phone).join(',')

      url = "http://sms.ru/sms/send?api_id=9d3359eb-9224-2384-5d06-1118975a2cd2&to="+t+"&text=Инфоком-НН (новая заявка) от "+@name+" "+@phone
      uri = URI.parse(URI.encode(url.strip))
      response = Net::HTTP.get_response(uri)

      flash[:success] = "Заявка успешно принята! Наш менеджер свяжется с Вами по телефону в самое ближайшее время."
      redirect_to requests_path
    else
      flash[:error] = "Заявка отклонено. Вы не заполнили одно из обязательных полей!"
      render "new"
    end
  end

    def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update_attributes(params[:request])
      flash[:success] = "Данные обновлены."
      redirect_to requests_path
    else
      render 'edit'
    end
  end

   def destroy
    Request.find(params[:id]).destroy
    flash[:success] = "Сообщение уничтожено."
    redirect_to requests_path
  end

  def fin
    @fin = Request.find(params[:id])
    @fin.toggle!(:finish)
    redirect_to requests_path
  end

  def doit
    @request = Request.find(params[:id])
    if @request.update_attributes(:manager_id => current_user.id)
      flash[:success] = "Данные обновлены."
      redirect_to requests_path
    else
      render 'edit'
    end
  end

  def notdoit
    @request = Request.find(params[:id])
    if @request.update_attributes(:manager_id => nil)
      flash[:success] = "Данные обновлены."
      redirect_to requests_path
    else
      render 'edit'
    end
  end

end
