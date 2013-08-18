# encoding: utf-8

class RequestsController < ApplicationController
   
  def index
    if signed_in?
      @requests = Request.order("created_at DESC").all
    end
  end


  def new
    @request = Request.new
  end

  def create
    @request = Request.new(params[:request])
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
