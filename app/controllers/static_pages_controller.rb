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


        phone = params[:message][:phone]
        name = params[:message][:name]

        RestClient.post("http://sms.ru/sms/send", :api_id => "9d3359eb-9224-2384-5d06-1118975a2cd2", :to => "79051916188,79092998514", :text => "Инфоком-НН (сообщение) от #{name} #{phone}")

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

  def sitemap
    @posts = Post.order("created_at DESC")
  end

  def sitemapxml
    headers['Content-Type'] = "application/xml"
    @posts = Post.order("created_at DESC")
    render :template => "/static_pages/sitemap"
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
