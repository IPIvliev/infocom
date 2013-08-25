# encoding: utf-8
class StaticPagesController < ApplicationController
  def index
  end

  def mail_to
    @new = params[:mail]
    if @new.present?
      @email = Email.new(:email => @new)
        if @email.save
          MarketingMailer.kp_email(@new).deliver
          flash[:success] = 'Коммерческое предложение успешно отправленно на '+@new
          redirect_to root_path
        else
          flash[:error] = 'Вы не правильно заполнили адрес электронной почты.'
          redirect_to root_path
        end
    else
      flash[:error] = 'Вы не заполнили адрес электронной почты.'
      redirect_to root_path
    end
  end

  def contacts
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:success] = "Ваше сообщение успешно отправленно. Менеджер Инфоком-НН свяжется с вами в ближайшее время."
      redirect_to '/contacts.html'
    else
      render 'contacts'
    end
  end


  def services
  end

  def about_us
  end

  def articles
    @posts = Post.paginate(page: params[:page], :per_page => 3).order("created_at DESC")
  end

  def help
  end

  def it_autsorsing
render :template => "/static_pages/services/it_autsorsing"
  end

  def it_audit
render :template => "/static_pages/services/it_audit"
  end

  def sait
render :template => "/static_pages/services/sait"
  end

  def local
render :template => "/static_pages/services/local"
  end

  def printers
render :template => "/static_pages/services/printers"
  end

  def servers
render :template => "/static_pages/services/servers"
  end
end
