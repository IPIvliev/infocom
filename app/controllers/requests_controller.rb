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

      phone = current_user.phone
      name = current_user.agent.name

      tel = User.where('status = ? OR status = ?', 3, 2).select("phone").map(&:phone).join(',')

      RestClient.post("http://sms.ru/sms/send", :api_id => "9d3359eb-9224-2384-5d06-1118975a2cd2", :to => tel, :text => "Инфоком-НН (новая заявка) от #{name} #{phone}")

      # Добавить запись о сроках подачи заявки

      @request.hists.create(:status => 3, :date => @request.created_at)

      flash[:success] = "#{tel} Заявка успешно принята! Наш менеджер свяжется с Вами по телефону в самое ближайшее время."
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

      @req.hists.create(:status => 6, :date => @req.updated_at)

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

    if !params[:more]
      @fin.hists.create(:status => params[:work], :date => @fin.updated_at)
    end

    if params[:more]
      @fin.hists.create(:status => 7, :date => @fin.updated_at)
    end
    redirect_to requests_path
  end



  def notdoit
    @request = Request.find(params[:id])
    if @request.update_attribute(:manager_id, nil)
      @request.update_attribute(:finish, 0)

      @request.hists.create(:status => 5, :date => @request.updated_at)

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