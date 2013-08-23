# encoding: utf-8

class MessagesController < ApplicationController

 def index
    @messages = Message.paginate(page: params[:page], :per_page => 10).order("created_at DESC")
  end

  def show
    @message = Message.find(params[:id])
  end




  def edit
    @message = Message.find(params[:id])
  end

  def update
  	@message = Message.find(params[:id])
    if @message.update_attributes(params[:message])
      flash[:success] = "Данные обновлены."
      redirect_to @message
    else
      render 'edit'
    end
  end

   def destroy
    Message.find(params[:id]).destroy
    flash[:success] = "Сообщение уничтожено."
    redirect_to posts_path
  end

end
