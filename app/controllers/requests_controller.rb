# encoding: utf-8

class RequestsController < ApplicationController
   
  def index
    if signed_in?
      @requests = Request.order("created_at DESC").where(user_id: current_user)

      if current_user.admin? || current_user.manager?
      @requests = Request.order("created_at DESC")
      end
    end
  end


  def new
    @request = Request.new
  end

  def create
 
    @request = current_user.requests.build(params[:request])
    if @request.save
      flash[:success] = "Заявка успешно принята! Наш менеджер свяжется с Вами по телефону в самое ближайшее время."
      redirect_to requests_path
    else
      flash[:error] = "Заявка отклонено. Вы не заполнили одно из обязательных полей!"
      render "new"
    end
  end

  def fin
    @fin = Request.find(params[:id])
    @fin.toggle!(:finish)
    redirect_to requests_path
  end

end
