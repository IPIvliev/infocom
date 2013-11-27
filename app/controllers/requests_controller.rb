# encoding: utf-8

class RequestsController < ApplicationController
   
  def index
    if signed_in?
      @requests = Request.paginate(page: params[:page], :per_page => 10).order("created_at DESC").where(user_id: current_user)

      if current_user.status == 3 || current_user.status == 2
      @requests = Request.paginate(page: params[:page], :per_page => 10).order("created_at DESC")
      end
    end
    @comments = Comment.where(:request_id => request)
  end

  def show
    @request = Request.find(params[:id])
    @comments = Comment.where(:request_id => @request)
    @comment = Comment.new
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

       t = User.where('status = ? OR status = ?', 3, 2).select("phone").map(&:phone).join(',')

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
    @req = Request.find(params[:id])
    if @req.update_attributes(params[:request])
      flash[:success] = "Данные обновлены."
        redirect_to request_path#(params[:id])

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
    @fin.update_attribute(:finish, params[:work])
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
      @request.update_attribute(:finish, 0)
      flash[:success] = "Данные обновлены."
      redirect_to requests_path#(params[:id])
    else
      render 'edit'
    end
  end


def newcomment 
    @comment = current_user.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "Комментарий отправлен!"
      redirect_to request_path(params[:id])
    else
      flash[:error] = "Произошла ошибка при отправке комментария: комментарий не может быть пустым."
      redirect_to request_path(params[:id])
    end
end

def deletecomment
    Comment.find(params[:id]).destroy
    flash[:success] = "Сообщение уничтожено."
    redirect_to request_path(params[:req])
end

end